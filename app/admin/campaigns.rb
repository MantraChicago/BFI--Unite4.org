ActiveAdmin.register Campaign do
  form  do |f|
     f.inputs "Details" do

      f.input :cause
      f.input :need
      #f.form_buffers.last << content_tag(:li, content_tag(:label, 'Need') + content_tag(:div, '', :class =>'input_holder'))
      f.input :active, :default =>true
      f.input :goal_summary
      f.input :timeframe_description
      f.input :start_date 
      f.input :end_date
      f.input :percent_complete
      f.input :desired_state
      f.input :current_state

    end
    f.buttons
   end
end


