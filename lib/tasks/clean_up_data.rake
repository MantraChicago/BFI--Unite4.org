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
end
