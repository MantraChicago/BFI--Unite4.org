class EveryUserGetsSignUpBadge < ActiveRecord::Migration
  def change

    User.all.each do |user|
      user.award_badge 'Signed Up'
    end
  end
end
