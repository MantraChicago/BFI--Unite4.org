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
    "inspire : empower : share : love"
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
    need.property(:call_to_action)
  end

  def goal_status_report campaign
    currency = campaign.type_of_need == "cash_donations" ? "$" : ""
    number =number_with_delimiter(campaign.current_state.to_i, :delimiter => ',')
    markup = "<strong>#{ currency } #{ number }</strong>"
    markup += "<em>#{ campaign.property(:past_action) }</em>"
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



  def contribution_info contribution
    ret_val=nil
    if contribution.need_type == 'cash_donations'
     ret_val= "Donated $#{contribution.fulfillment.amount}"
    elsif contribution.need_type == 'volunteers'
      ret_val= "Provided their contact information #{contribution.fulfillment.name} #{contribution.fulfillment.phone_number} #{contribution.fulfillment.email}"
    elsif contribution.need_type == 'goods_donations'
      ret_val= "Provided their contact information #{contribution.fulfillment.name} #{contribution.fulfillment.phone_number} #{contribution.fulfillment.email}"
    end
    ret_val      
  end

  def cause_type_text cause_type
    key = cause_type.slug
    texts={'arts' => "Join together with local artists, museums, and city park districts to organize events and performances that benefit the entire community. Unite4.org brings volunteers, nonprofits, and the art community together in the spirit of kindness and compassion.",
           'education' => "Help support safe, positive environments where students can learn and grow beyond the classroom. These nonprofits work to overcome learning differences, disabilities, and poverty through mentoring programs and after school activities that foster creativity and teamwork. Contributions provide hope for the future and enhance the entire community.",
           'environmental' => "Make an immediate impact right in your own backyard. These organizations help plant trees, clean littered highways, and build local parks with support from the government and the local corporate community. Their tireless efforts beautify urban areas and make neighborhoods safer and more eco-friendly.",
           'health-wellness' => "Improve the quality of life and overall well-being of your neighbors. Your act of kindness assists in offering therapy for the mentally and physically disabled and furthers research and development. Help spread awareness and make your community a healthier, more compassionate place.",
           'youth' => "Make a positive impact that lasts for generations. Your contribution helps provide counseling, guidance, and a variety of programs that build self-esteem and allow children to embrace their full potential. Help create an enduring positive footprint and a brighter future for all of us to look forward to.",
           'religion' => "",
           'global-outreach' => "Make a real difference in the lives of people all around the world. Donating to global charities helps bring humanitarian aid and medical assistance to impoverished communities that are in dire need. Just as with donations on the domestic level, Unite4.org lets you see directly how your efforts are being put to use.",
           'social-equality' => "Make a positive impact that lasts for generations. Your contribution helps provide counseling, guidance, and a variety of programs that build self-esteem and allow children to embrace their full potential. Help create an enduring positive footprint and a brighter future for all of us to look forward to.",
           'animal-welfare' => "Help spread Unite4.org's mission of compassion and empathy to the four-legged members of the community. Your contribution aids in the preservation of local wildlife and supports shelters and foster home networks whose positive influence creates practical change that benefits not only humanity, but also the animals we share our world with."
            }
    texts[key]
  end

  def cause_need_button (need, options={})
    has_contributed= ((current_user) && (current_user.has_contributed_to_need need))
    show_modal_on_cause_page= options[:show_modal_on_cause_page] || false
    button_classes = ['btn']
    button_classes << need.property(:color)
    
    if show_modal_on_cause_page
      href= "#{url_for need.cause}?show_campaign_modal=true"
    elsif need.type_of_need =='followers'
      href="/causes/#{ need.cause.slug }/followers"
      button_classes << 'first-sign-in'
    else
      button_classes << 'open-fulfillment-modal'
      href= ''
    end

    if options[:class]
      button_classes= button_classes.concat options[:class]
    end

    if has_contributed
      button_classes << 'contributed'
    end

    text = need.property(:call_to_action)

    link_to text, href, 'class' =>  button_classes.join(' '),'data-type-of-need' => need.type, 'data-need-id' => need.id
  end

  def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end


  def get_array_of_badges user
    ret_array=[]
    earned_badges=user.user_badges.sort_by(&:id).reverse
    unearned_badges=[]
    Badge.active.all.each do |badge|
      unearned_badges << badge if ! user.badges.include?(badge)
    end

    earned_badges.concat unearned_badges

  end

end
