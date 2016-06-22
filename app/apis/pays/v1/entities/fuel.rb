module Pays
module V1
module Entities

class Fuel < Grape::Entity
	expose :id, documentation: { type: Integer, desc: '账户ID' }
	expose :number, documentation: { type: String, desc: '账户号' }
	expose :unit, documentation: { type: String, desc: '收费单位' }
	expose :name, documentation: { type: String, desc: '户主姓名' }
	expose :address, documentation: { type: String, desc: '户主地址' }
	expose :balance, documentation: { type: Numeric, desc: '账户余额' }
	expose :deleted, documentation: { type: String, desc: '账户未激活？' }
end

end
end
end