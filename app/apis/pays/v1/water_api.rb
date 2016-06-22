module Pays
module V1

class WaterAPI < Grape::API
	desc '检索账户' do
		# success Entities::Water
		failure [
			[404, '没有找到该账户'],
		]
	end
	params do
		requires :number, type: String, message: :requires, desc: '账户编号'
		# requires :name, type: String, message: :requires, desc: '户主姓名'
	end
	get 'search' do
		@water = Pays::Water.find_by(number: params[:number])
		error!('没有找到该账户', 404) if @water.nil?
    # present @water, with: Entities::Water
    present @water, with: Entities::Water
	end


	desc '缴费' do
		# success Entities::Water
		failure [
			[404, '没有找到该账户'],
			[499, '操作失败'],
			[498, '缴费金额不合理'],
		]
	end
	params do
		requires :id, type: Integer, message: :requires, desc: '账户ID'
		requires :money, type: String, message: :requires, desc: '缴费金额'
	end
	put 'pay' do
		@water = Pays::Water.find_by(id: params[:id])
		error!('没有找到该账户', 404) if @water.nil?
		error!('缴费金额不合理', 498) if params[:money].nil? || params[:money].to_f<=0
		error_by! @water.update_attribute(:balance, @water.balance+params[:money].to_f)
	
		# 生成记录
		@record = record!('water', @water)		
		
    { 
    	'成功缴费余额': params[:money],
    	'当前账户余额': @water.balance,
    	'订单号': @record.order
    }
	end


	desc '多项匹配账户信息' do
		# success Entities::Water
		failure [
			[404, '没有找到该账户'],
		]
	end
	params do
		requires :number, type: String, message: :requires, desc: '账户号'
		requires :name, type: String, message: :requires, desc: '户主姓名'
	end
	post 'match' do
		@water = Pays::Water.where(number: params[:number], name: params[:name]).first
		# 账户不存在
		if @water.nil?
			error!('没有找到该账户', 404)
		end
    present @water, with: Entities::Water
	end


	params do
		# requires :token, type: String, desc: '用户授权凭证，登录成功时获取', message: :requires
	end
	namespace do
		before do
			# authenticate!
		end

		desc '获取账户信息' do
			# success Entities::Water
			failure [
				[401, '认证失败'],
				[400, 'ID参数出错'],
				[404, '没有找到该账户'],
			]
		end
		params do
			requires :id, type: Integer, message: :requires, desc: '账户ID'
		end
		get ':id' do
			@water = Pays::Water.find_by(id: params[:id])
			# id账户不存在
			if @water.nil?
				error!('没有找到该账户', 404)
			end
	    present @water, with: Entities::Water
		end


		desc '获取所有账户' do
			# success Entities::Water
		end
		params do
		end
		get '/' do
			@waters = Pays::Water.order(created_at: :desc)
	    present @waters, with: Entities::Water
		end


		desc '创建账户信息' do
			failure [
				[401, '认证失败'],
				[498, '账户号已存在'],
				[499, '操作失败'],
			]
		end
		params do
	 		requires :number, type: String, desc: '账户号', message: :requires
	 		requires :unit, type: String, desc: '收费单位', message: :requires
	 		requires :name, type: String, desc: '户主姓名', message: :requires
	 		optional :address, type: String, desc: '户主地址'
	 		optional :balance, type: String, desc: '账户余额'
	 		optional :deleted, type: Boolean, desc: '账户未激活？'
		end
		post '/' do
			if Pays::Water.exists?(number: params[:number])
				error!('账户号已存在', 498)
			end
			if params[:balance] && params[:balance].to_f <= 0
				error!('账户余额不合法', 400)
			end
			# @water = Pays::Water.new(params.permit(:number, :unit, :name, :address, :balance, :deleted))
			@water = Pays::Water.new( water_params )
			# 执行操作，失败直接返回
			@water.save
			# 正确返回
			return_success
		end


		desc '修改账户信息' do
			# success Entities::Water
			failure [
				[401, '认证失败'],
				[400, 'ID参数出错'],
				[404, '没有找到该账户'],
				[499, '操作失败'],
				[498, '账户号已存在'],
			]
		end
		params do
			requires :id, type: Integer, desc: '账户ID', message: :requires
	 		optional :number, type: String, desc: '账户号'
	 		optional :unit, type: String, desc: '收费单位'
	 		optional :name, type: String, desc: '户主姓名'
	 		optional :address, type: String, desc: '户主地址'
	 		optional :balance, type: String, desc: '账户余额'
	 		optional :deleted, type: Boolean, desc: '账户未激活？'
		end
		put ':id' do
			@water = Pays::Water.find_by(id: params[:id])
			if @water.nil?
				error!('没有找到该账户', 404)
			end
			if @water.number != params[:number] && Pays::Water.exists?(number: params[:number])
				error!('账户编号已存在', 498)
			end
			if params[:balance] && params[:balance].to_f <= 0
				error!('账户余额不合法', 400)
			end
			# 执行操作，失败直接返回
			@water.update( water_params )
			# 正确返回
			return_success
		end
		

		desc '删除账户信息' do
			# success Entities::Water
			failure [
				[401, '认证失败'],
				[400, 'ID参数出错'],
				[404, '没有找到该账户'],
				[499, '操作失败'],
			]
		end
		params do
			requires :id, type: Integer, desc: '账户ID', message: :requires
		end
		delete ':id' do
			status 204
			@water = Pays::Water.find_by(id: params[:id])
			if @water.nil?
				error!('没有找到该账户', 404)
			end
			# 执行操作，失败直接返回
			@water.destroy
			# 正确返回
			return_success
		end
	end
end

end
end