class Cause < ActiveRecord::Base
   attr_accessible :facebook_url,:twitter_handle, :video_link,:is_featured,:picture,:city, :state, :name, :description, :mission_statement, :how_hear, :email, :website, :phone_number, :cause_type_id, :picture_updated_at, :picture_updated_at, :picture_content_type, :picture_updated_at, :picture_updated_at, :picture_updated_at, :picture_file_name, :picture_file_size
   
   has_attached_file  :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.jpeg"

   has_many :needs
   
   belongs_to :cause_type
   has_many :locations, :dependent => :delete_all

   def location
    location = ""
    if city
      location = city
    end

    if state
      location = state
    end

    if city and state
      location = "#{city}, #{state}"
    end

    location
  end

end
