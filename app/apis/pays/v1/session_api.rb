module Pays
module V1

class SessionAPI < Grape::API
	desc '登录' do
		failure([
			[401, '授权失败'],
		])
	end
	params do
		requires :username, type: String, desc: '用户名', message: :requires
		requires :password, type: String, desc: '密码', message: :requires
	end
	post '/' do
		@user = Pays::User.find_by(username: params[:username])
		if !@user || !@user.authenticate(params[:password])
			error!('登陆失败，用户名或密码错误', 401)
		end
		@user.token = JWT.encode({ user_id: @user.id }, 'key')

    present @user, with: Entities::User
	end


	desc '注销'
	delete do
		# session.delete(:user_id)
		# @current_user = nil
		return_success
	end
end

end
end