module Pays
module V1

class BaseAPI < Grape::API
	format :json

	# 全局helper方法
	helpers do
		# 操作如果失败直接返回
		def error_by!(opt)
			error!('操作失败', 499)	 if !opt
		end

		# 操作成功返回
		def return_success
			{ success: true }
		end

		# 认证
		def authenticate!
			begin
				payload,  = JWT.decode(params[:token], 'key')
				@current_user = User.find_by(id: payload['user_id'])
			rescue StandardError
			end
			error!('认证失败', 401) if @current_user.nil?
		end

		# 获取当前用户
		def current_user
			@current_user
		end

		# 生成缴费记录
		def record!(type, account)
			record_params = Hash.new
	 		loop do
				record_params[:order] = "order#{(0..9).to_a.shuffle.join}"
				break if !Record.exists?(order: record_params[:order])
			end
			record_params[:item] = type
			record_params[:number] = account.number
			record_params[:name] = account.name
			record_params[:money] = params[:money]
			record_params[:balance] = account.balance
			@record = Record.new(record_params)
			error_by! @record.save

			@record
		end

		# 健壮参数处理
		def fuel_params
		 	ActionController::Parameters.new(params).permit(:number, :unit, :name, :address, :balance, :deleted)
		end 
		def water_params
		 	ActionController::Parameters.new(params).permit(:number, :unit, :name, :address, :balance, :deleted)
		end 
		def record_params
		 	ActionController::Parameters.new(params).permit(:item, :number, :name, :money, :balance, :order)
		end 
	end

	# 挂载api
	mount FuelAPI => 'fuels'
	mount WaterAPI => 'waters'
	mount RecordAPI => 'records'
	mount SessionAPI => 'sessions'
	mount UserAPI => 'users'
	# mount TestAPI => 'tests'
end

end
end