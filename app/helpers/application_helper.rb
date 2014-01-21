module ApplicationHelper
	def active(path)
	   	if current_page?(path)
		    "active_page"
		end
	end
end
