module ApplicationHelper
  def body_id
    controller_name + '_' + action_name
  end

  def body_class
    controller_name
  end

  def render_title
    return @title if @title.present?
    "Give Inspire Love"
  end

  def button_text_for_need need
    case need.type_of_need
    when "followers"
      "Follow"
    when "volunteers"
      "Volunteer"
    else
      "Give"
    end
  end

end
