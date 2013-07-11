ActiveAdmin.register Need do
form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do

      f.input :name
      f.input :type_of_need, :collection => ['goods_donations','money_donation','follow','volunteer']
      f.input :cause
      f.input :description
      f.input :location
      
      
      f.input :address
      f.input :start_date
      f.input :end_date
      

      f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:medium))

    end
    f.buttons
   end  
end
