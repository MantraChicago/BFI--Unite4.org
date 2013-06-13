class PagesController < ApplicationController
	def index
		@subscribe = Subscribe.new
		@new_causes = Cause.order('created_at asc').limit(4);
		@featured_causes=Cause.find_all_by_is_featured(true);
		@recent_needs=Need.order('created_at asc').limit(4);

		
		@featured_users = User.random 2
		

		#for map
		#@causes=Cause.all
		#@locations=Location.all
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
