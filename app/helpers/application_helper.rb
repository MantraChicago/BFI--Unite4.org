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
    Need::GivingActions[type_of_need]
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

   def need_type_properties need_type
    need_properties_map={goods_donations: {
                          call_to_action:'Donate goods',
                          past_personal_action:'I donated goods',
                          color:'pink'
                        },
                       followers: {
                          call_to_action:'Promote',
                          past_personal_action:'I promoted this cause',
                          color:'blue'
                        },
                       cash_donations: {
                          call_to_action:'I donated money',
                          color:'green'
                        },
                       volunteers: {
                          call_to_action:'I volunteered',
                          color:'black'
                        }}
    need_properties_map[need_type.to_sym]
  end

end
