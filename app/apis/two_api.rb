class TwoAPI < Grape::API
	format :json

	get '/' do
		{ position: 'TwoAPI' }
	end

end
