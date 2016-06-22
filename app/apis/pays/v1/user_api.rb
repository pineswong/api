module Pays
module V1

class UserAPI < Grape::API
	# desc '用户注册' do
	# 	failure [
	# 		[498, '用户名已存在'],
	# 		[499, '操作失败'],
	# 	]
	# end
	# params do
 # 		requires :username, type: String, desc: '用户名', message: :requires
 # 		requires :password, type: String, desc: '密码', message: :requires
 # 		optional :email, type: String, desc: '电子邮箱'
 # 		optional :phone, type: String, desc: '手机号'
 # 		optional :admin, type: Boolean, desc: '管理员？'
 # 		optional :deleted, type: Boolean, desc: '账户未激活？'
	# end
	# post '/' do
	# 	if Pays::User.exists?(username: params[:username])
	# 		error!('用户名已存在', 498)
	# 	end
	# 	@user = Pays::User.new(declared(params, include_missing: false))
	# 	# 执行操作，失败直接返回
	# 	error_by!(@user.save)
	# 	# 正确返回
	# 	return_success
	# end


	# 以下操作需要认证
	params do
		# requires :token, type: String, desc: '用户授权凭证，登录成功时获取'
	end
	namespace do
		before do
			# authenticate!
		end


		desc '获取所有账户' do
			# success Entities::User
		end
		get '/' do
			@users = Pays::User.all
	    present @users, with: Entities::User
			# error_by!(false)
		end
	end
end

end
end