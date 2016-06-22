class Pays::Fuel < ActiveRecord::Base
	validates :number, presence: true		# 户号
	validates :unit, presence: true			# 收费单位
	validates :name, presence: true			# 户名
end
