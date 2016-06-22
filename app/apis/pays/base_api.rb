module Pays

class BaseAPI < Grape::API
	mount V1::BaseAPI => 'v1' 
	# mount V2::BaseAPI => 'v2'
end

end
