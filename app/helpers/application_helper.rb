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

  def limit_to_three_words(phrase="")
    unless phrase.nil?
      phrase.split(' ').slice(0,3).join(' ')
    end
  end

  def replace_newlines_with_linebreaks text=""
    "#{ text }".gsub(/\n/,'<br/>').html_safe
  end

  def button_text_for_need need
    type_of_need = need.is_a?(Need) ? need.type_of_need : need

    case type_of_need
    when "followers"
      "Follow"
    when "volunteers"
      "Volunteer"
    else
      "Give"
    end
  end

  #for devise login
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
