class Tests::BaseAPI < Grape::API
	get '/' do
		{ position: 'tests' }
	end
end