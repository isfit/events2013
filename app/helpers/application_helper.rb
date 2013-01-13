module ApplicationHelper

	def format(str)
	    bc = BlueCloth.new(str) 
	    text = bc.to_html
	    return text.html_safe
	end

end
