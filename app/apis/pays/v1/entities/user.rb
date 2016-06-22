module Pays
module V1
module Entities

class User < Grape::Entity
	expose :id, documentation: { type: Integer, desc: '账户ID' }
	expose :username, documentation: { type: String, desc: '用户名' }
	expose :password_digest, documentation: { type: String, desc: '密码摘要' }
	expose :remember_digest, documentation: { type: String, desc: '记住用户摘要' }
	expose :email, documentation: { type: String, desc: '电子邮箱' }
	expose :phone, documentation: { type: String, desc: '手机号' }
	expose :admin, documentation: { type: String, desc: '管理员？' }
	expose :deleted, documentation: { type: String, desc: '账户未激活？' }
	expose :token, documentation: { type: String, desc: '登陆Token' }
end

end
end
end