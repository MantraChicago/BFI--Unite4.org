ActiveAdmin.register Badge do

  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :description_after
      f.input :description_before
      f.input :sub_text
      f.input :is_active
      f.input :image, :as => :file
      
    end
    f.buttons
   end  
end
