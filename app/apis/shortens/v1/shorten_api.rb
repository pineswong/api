module Shortens
module V1

class ShortenAPI < Grape::API
	desc '所有数据', {
  	detail: '',
  	success: Entities::Shorten, # or success
	  failure: # or failure
			[
		  	{ code: 600, message: '服务器出错' },
		  	{ code: 601, message: '未授权' },
		  	{ code: 602, message: '请求参数出错' },
		  	{ code: 603, message: '禁止请求' },
		  	{ code: 604, message: '未找到数据' },
		  ],

	  # nickname: 'getKittens',
	  # hidden: true,
	  # is_array: true,
	  # # also explicit as hash: [{ code: 401, mssage: 'KittenBitesError', model: Entities::BadKitten }]
	  # produces: [ "array", "of", "mime_types" ],
	  # consumes: [ "array", "of", "mime_types" ], }
	}
	params do
	end
	get 'all' do
		@shortens = Shortens::Shorten.order(updated_at: :desc)
		return present @shortens, with: Entities::Shorten
	end


	desc '生成短链', {
  	detail: '',
  	success: Entities::Shorten, # or success
	  failure:
			[
		  	{ code: 600, message: '服务器出错' },
		  	{ code: 601, message: '未授权' },
		  	{ code: 602, message: '请求参数出错' },
		  	{ code: 603, message: '禁止请求' },
		  	{ code: 604, message: '未找到数据' },
		  ],
	}
	params do
		requires :url, type: String, desc: '原始url', regexp: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, documentation: { default: 'http://www.pinewong.com' }
	end
	post '/' do
		# 参数处理
		params[:url] = params[:url].strip.chomp('/')

		@shorten = Shortens::Shorten.find_by(url: params[:url])
		# 数据库存在直接返回
		return present @shorten, with: Entities::Shorten if @shorten

		# 生成数据库不存在的短链
		loop do
			params[:short] = server_url + random_str
			break !Shortens::Shorten.exists?(short: params[:short])
		end

		# 保存
		@shorten = Shortens::Shorten.new( shorten_params )
		error!('操作失败！', 600) if !@shorten.save
		present @shorten, with: Entities::Shorten
	end


	desc '查询数据', {
  	detail: '',
  	success: Entities::Shorten, # or success
	  failure: 
			[
		  	{ code: 600, message: '服务器出错' },
		  	{ code: 601, message: '未授权' },
		  	{ code: 602, message: '请求参数出错' },
		  	{ code: 603, message: '禁止请求' },
		  	{ code: 604, message: '未找到数据' },
		  ],
	}
	params do
		optional :short, type: String, desc: '短链', regexp: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, documentation: { default: 'http://urlis.cn/aaaaa' }
	  optional :url, type: String, desc: '原始url', regexp: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, documentation: { default: 'http://www.pinewong.com' }
	  exactly_one_of :short, :url
	end
	get '/' do
		@shorten = Shortens::Shorten.find_by(url: params[:url].strip.chomp('/')) if params[:url]
		@shorten = Shortens::Shorten.find_by( short: params[:short].strip.chomp('/') ) if params[:short]

		error!('操作失败！没有找到数据', 604) if !@shorten
		@shorten.count += 1
		@shorten.save_without_timestamping
		present @shorten, with: Entities::Shorten
	end


	desc '修改url', {
  	detail: '',
  	success: Entities::Shorten, # or success
	  failure: 
			[
		  	{ code: 600, message: '服务器出错' },
		  	{ code: 601, message: '未授权' },
		  	{ code: 602, message: '请求参数出错' },
		  	{ code: 603, message: '禁止请求' },
		  	{ code: 604, message: '未找到数据' },
		  ],
	}
	params do
		requires :short, type: String, desc: '短链', regexp: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, documentation: { default: 'http://urlis.cn/aaaaa' }
	  requires :url, type: String, desc: 'url', regexp: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, documentation: { default: 'http://www.pinewong.com' }
	end
	put '/' do
		# 参数处理
		params[:short] = params[:short].strip.chomp('/')
		params[:url] = params[:url].strip.chomp('/')

		@shorten = Shortens::Shorten.find_by(short: params[:short])
		error!('操作失败！没有找到数据', 604) if !@shorten
		error!('操作失败！新链接与原链接一致', 602) if @shorten.url == params[:url]
		@shorten.url = params[:url]
		@shorten.save
		present @shorten, with: Entities::Shorten
	end
end

end
end









