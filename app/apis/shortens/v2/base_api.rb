module Shortens
module V2

class BaseAPI < Grape::API
	# version :v2, using: :path
	format :xml

	helpers do
		# 获取随机字符串
		def random_str(length = 5)
			str = ''
			length.times do
				str << [*('a'..'z'), *('A'..'Z'), *(0..9)].sample.to_s
			end
			str
		end

		# 健壮参数
		def shorten_params
		 	ActionController::Parameters.new(params).permit(:short, :url)
		end 
	end

	mount ShortenAPI
end

end
end