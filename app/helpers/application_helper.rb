module ApplicationHelper
  def body_id
    controller_name + '_' + action_name
  end

  def params_id
    params[:id]
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
    properties= need_type_properties(type_of_need)
    if properties
      properties[:call_to_action]
    end
  end

  def goal_status_report campaign
    campaign ||= Campaign.new
    currency = campaign.type_of_need == "cash_donations" ? "$" : ""
    number =number_with_delimiter(campaign.current_state, :delimiter => ',')
    markup = "<strong>#{ currency } #{ number }</strong>"
    markup += "<em>#{ need_type_properties(campaign.type_of_need)[:past_action] }</em>"

    markup.html_safe
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
                          past_action:'Donated',
                          color:'pink'
                        },
                       followers: {
                          call_to_action:'Follow',
                          past_personal_action:'I promoted this cause',
                          past_action:'Promoted',
                          color:'blue'
                        },
                       cash_donations: {
                          call_to_action:'Donate money',
                          past_personal_action:'I donated money',
                          past_action:'Donated',
                          color:'green'
                        },
                       volunteers: {
                          call_to_action:'Volunteer',
                          past_personal_action:'I volunteered',
                          past_action:'Volunteered',
                          color:'black'
                        }}
    need_properties_map[need_type.to_sym]
  end


  def cause_type_text cause_type
    key = cause_type.slug
    texts={'arts' => "Join together with local artists, museums, and city park districts to organize events and performances that benefit the entire community. Unite4.org brings volunteers, nonprofits, and the art community together in the spirit of kindness and compassion.",
           'education' => "Help support safe, positive environments where students can learn and grow beyond the classroom. These nonprofits work to overcome learning differences, disabilities, and poverty through mentoring programs and after school activities that foster creativity and teamwork. Contributions provide hope for the future and enhance the entire community.",
           'environment' => "Make an immediate impact right in your own backyard. These organizations help plant trees, clean littered highways, and build local parks with support from the government and the local corporate community. Their tireless efforts beautify urban areas and make neighborhoods safer and more eco-friendly.",
           'health-wellness' => "Improve the quality of life and overall well-being of your neighbors. Your act of kindness assists in offering therapy for the mentally and physically disabled and furthers research and development. Help spread awareness and make your community a healthier, more compassionate place.",
           'youth' => "Make a positive impact that lasts for generations. Your contribution helps provide counseling, guidance, and a variety of programs that build self-esteem and allow children to embrace their full potential. Help create an enduring positive footprint and a brighter future for all of us to look forward to.",
           'religion' => "",
           'global-outreach' => "Make a real difference in the lives of people all around the world. Donating to global charities helps bring humanitarian aid and medical assistance to impoverished communities that are in dire need. Just as with donations on the domestic level, Unite4.org lets you see directly how your efforts are being put to use.",
           'social-equality' => "Make a positive impact that lasts for generations. Your contribution helps provide counseling, guidance, and a variety of programs that build self-esteem and allow children to embrace their full potential. Help create an enduring positive footprint and a brighter future for all of us to look forward to.",
           'animal-welfare' => "Help spread Unite4.org's mission of compassion and empathy to the four-legged members of the community. Your contribution aids in the preservation of local wildlife and supports shelters and foster home networks whose positive influence creates practical change that benefits not only humanity, but also the animals we share our world with."
            }
    texts[key]


  end
end
