class EveryUserGetsSignUpBadge < ActiveRecord::Migration
  def change
    Rake::Task['db:seed'].invoke #get badges in

    User.all.each do |user|
      user.award_badge 'Signed Up'
    end
  end
end
