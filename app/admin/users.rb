ActiveAdmin.register User do
  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do

      f.input :first_name
      f.input :last_name
      f.input :bio
      f.input :email
      f.input :city
      f.input :state
      
      

      f.input :avatar, :as => :file, :hint => f.template.image_tag(f.object.avatar.url(:thumb))

    end
    f.buttons
   end   
end
