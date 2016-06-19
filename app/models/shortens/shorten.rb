class Shortens::Shorten < ActiveRecord::Base
	# 不修改时间戳保存
	def save_without_timestamping
		class << self
		  def record_timestamps; false; end
		end
		save
		class << self
		  remove_method :record_timestamps
		end
	end
end
