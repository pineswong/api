class Pays::User < ActiveRecord::Base
	# 安全验证
	has_secure_password
	attr_accessor :token

	
	# 返回指定字符串的哈希摘要
	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end
