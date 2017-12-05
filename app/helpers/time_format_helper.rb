module TimeFormatHelper
	def created_time
	  created_at.strftime("%A, %B %d, %Y")
	end
end