module ApplicationHelper
	def additional_head_content
		unless @additional_head_content==nil
			@additional_head_content
		end
	end

	def render_title
	  return @title if defined?(@title)
	  "Give Inspire Love"
	end
end
