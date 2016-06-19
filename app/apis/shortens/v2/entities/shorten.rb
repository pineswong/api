module Shortens
module V2
module Entities

class Shorten < Grape::Entity
	expose :short, documentation: { type: String, desc: '短链' }
	expose :url, documentation: { type: String, desc: '原Url' }
	expose :count, documentation: { type: Integer, desc: '统计次数' }
	expose :updated_at, documentation: { type: Date, desc: '修改时间' }
	expose :created_at, documentation: { type: Date, desc: '创建时间' }
end

end
end
end