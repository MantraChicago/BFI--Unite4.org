module ApplicationHelper
  def body_id
    controller_name + '_' + action_name
  end

  def body_class
    controller_name
  end

	def additional_head_content
		unless @additional_head_content==nil
			@additional_head_content
		end
	end

	def render_title
	  return @title if @title.present?
	  "Give Inspire Love"
	end


end
