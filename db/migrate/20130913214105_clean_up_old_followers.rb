class CleanUpOldFollowers < ActiveRecord::Migration
  def up
    Cause.all.each do |cause|
      cause.followers.each do |follower|
        if ! follower.user
          follower.delete
        end
      end
    end
  end

end
