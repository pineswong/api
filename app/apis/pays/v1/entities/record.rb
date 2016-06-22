module Pays
module V1
module Entities

class Record < Grape::Entity
	expose :id, documentation: { type: Integer, desc: '记录ID' }
	expose :order, documentation: { type: String, desc: '订单号' }
	expose :item, documentation: { type: String, desc: '订单项目' }
	expose :number, documentation: { type: String, desc: '账户号' }
	expose :name, documentation: { type: String, desc: '户主姓名' }
	expose :money, documentation: { type: Numeric, desc: '缴费金额' }
	expose :balance, documentation: { type: Numeric, desc: '账户余额' }
	expose :deleted, documentation: { type: String, desc: '账户未激活？' }
	expose :created_at, documentation: { type: String, desc: '订单创建时间' }
end

end
end
end