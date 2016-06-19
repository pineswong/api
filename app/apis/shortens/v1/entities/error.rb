module Shortens
module V1
module Entities

class Error < Grape::Entity
	# expose :status, documentation: { type: Integer, desc: '状态码' }
	expose :error, documentation: { type: String, desc: '错误信息' }
end

end
end
end