class OneAPI < Grape::API
	format :json
	version :v1, using: :path

	get '/' do
		{ position: 'OneAPI' }
	end

end
