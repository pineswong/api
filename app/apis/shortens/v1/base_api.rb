module Shortens
module V1

class BaseAPI < Grape::API
	# version :v1, using: :path

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

		# 定义错误文档信息
		def desc_failure
			[
		  	{ code: 600, message: '服务器出错', model: Entities::Error },
		  	{ code: 601, message: '未授权' },
		  	{ code: 602, message: '请求参数出错' },
		  	{ code: 603, message: '禁止请求' },
		  	{ code: 604, message: '未找到数据' },
		  	# [401, '主动错误', Entities::Error],
		  ]
		end
	end

	mount ShortenAPI
end

end
end