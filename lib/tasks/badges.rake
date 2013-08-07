namespace 'badges' do 
  desc 'Gives badges to users based on their events'
  task 'calculate_all_user_badges' => [:environment] do
    Unite::Badges::BadgeCalculator.calculate_all_badges_for_all_users
  end
  
end