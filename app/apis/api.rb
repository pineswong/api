class API < Grape::API
	format :json

	get '/' do
		{ position: 'root' }
	end

	# mount OneAPI => 'one'
	# mount TwoAPI => 'two'
	mount Shortens::BaseAPI => 'shortens'
	mount Tests::BaseAPI => 'tests'

  add_swagger_documentation \
		doc_version: 'v1',
		models: [
			Shortens::V1::Entities::Shorten,
			# Shortens::V2::Entities::Shorten,
		],
   		info: {
	    title: "API文档 - URL IS",
	    description: "API服务器地址：http://api.urlis.cn",
	    contact_name: "PineWong",
	    contact_email: "pinewong@163.com",
	    # contact_url: "http://www.pinewong.com",
	    license: "PineWong",
	    license_url: "http://www.pinewong.com",
    	# terms_of_service_url: "www.The-URL-of-the-terms-and-service.com",
 	  }
  # add_swagger_documentation base_path: 'api', hide_format: true
end
