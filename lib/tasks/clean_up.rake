namespace :clean_up do
  task :give_name_to_empty_follow_cause => [:environment] do
    Need.all.each do |need|
      if need.type_of_need == 'followers' && need.name.empty?
        need.name = "Help promote #{need.cause.name}"
        need.save
        puts need.name
      end
    end
  end

  task :set_all_user_to_have_only_sign_up_badge => [:environment] do
    User.all.each do |user|
      user.badges= []
      user.award_badge 'Sign Up'
      user.save
    end
  end

  task :save_cause_images => [:environment] do
    Cause.all.each do |cause|
      dir="/home/deploy/cause_images/#{cause.slug}/*.jpg"
      #dir = "/Users/Eddie/Downloads/cause_images/#{cause.slug}/*.jpg"
      files=Dir.glob(dir) 
      files.each do |file|

        picture_file=File.new(file, "r")
        cause_image = CauseImage.create({:cause_id => cause.id,
                                         :picture => picture_file })
        
      end
    end
  end
end
