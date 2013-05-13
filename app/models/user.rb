class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :avatar_updated_at, :avatar_updated_at, :avatar_updated_at, :avatar_updated_at, :avatar_updated_at,  :avatar_file_size,:avatar_file_name,:avatar_content_type, :bio,:provider, :uid,:cause_ids, :usercause_ids,:avatar,:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :encrypted_password, :remember_created_at, :current_sign_in_at, :last_sign_in_at, :last_sign_in_ip, :reset_password_token, :reset_password_sent_at, :current_sign_in_ip, :reset_password_sent_at, :current_sign_in_at, :last_sign_in_at, :img_name, :current_sign_in_at, :last_sign_in_at

  has_many :usercauses
  has_many :causes, :through => :usercauses

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.jpeg"

  validates :first_name, :last_name, :presence => true


  def display_name
  	first_name+' '+last_name
  end
end
