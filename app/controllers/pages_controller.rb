class PagesController < ApplicationController
	def index
		@subscribe = Subscribe.new
		@new_causes = Cause.order('created_at asc').limit(4);
		@featured_causes=Cause.find(:all, :order => 'RANDOM()', :limit=>3, :conditions=>{:is_featured=>true})
		@recent_needs=Need.order('created_at asc').limit(4);

		
		@featured_users = User.random 2
		@campaigns=Campaign.find(:all, :order => 'RANDOM()', :limit=>4)
	end


end

module ActiveRecord
  class Base
    def self.random number
      if (c = count) != 0
      	 find(:all,:limit =>number, :order => 'RANDOM()')
      	 else
      	 []  
      end
    end
  end
end
