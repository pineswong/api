module Shortens
module V2

class ShortenAPI < Grape::API
	desc '生成短链'
	params do
		requires :url, type: String, desc: '原始url', regexp: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
	end
	post '/' do
		# 数据库存在直接返回
		@shorten = Shortens::Shorten.find_by(url: params[:url])
		return present @shorten, with: Entities::Shorten if @shorten

		# 生成数据库不存在的短链
		loop do
			params[:short] = random_str
			break !Shortens::Shorten.exists?(short: params[:short])
		end

		# 保存
		@shorten = Shortens::Shorten.new( shorten_params )
		error!('操作失败！', 200) if !@shorten.save
		present @shorten, with: Entities::Shorten
	end


	desc '查询数据'
	params do
		optional :short, type: String, desc: '短链'
	  optional :url, type: String, desc: '原始url', regexp: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
	  exactly_one_of :short, :url		
	end
	get '/' do
		@shorten = Shortens::Shorten.find_by(short: params[:short]) if params[:short]
		@shorten = Shortens::Shorten.find_by(url: params[:url]) if params[:url]

		error!('操作失败！没有找到数据', 200) if !@shorten
		@shorten.count += 1
		@shorten.save_without_timestamping
		present @shorten, with: Entities::Shorten
	end


	desc '修改url'
	params do
		requires :short, type: String, desc: '短链'
	  requires :url, type: String, desc: 'url', regexp: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
	end
	put '/' do
		@shorten = Shortens::Shorten.find_by(short: params[:short])
		error!('操作失败！没有找到数据', 200) if !@shorten
		error!('操作失败！新链接与原链接一致', 200) if @shorten.url == params[:url]
		@shorten.url = params[:url]
		@shorten.save
		present @shorten, with: Entities::Shorten
	end
end

end
end









