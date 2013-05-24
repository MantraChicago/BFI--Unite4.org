module Level_0 
	def before_render
		@user = current_user
	end

	def on_submit
		 @user =current_user
		if @user.update_attributes(params[:user])
			if(@user.bio.empty? || !@user.avatar_file_name?)
				return "Your profile has empty fields"
			end
			return true
		else
	        return false
	    end

	end
end

module Level_1 
	def before_render
		
	end

	def on_submit

		emails= [params[:email1],params[:email2],params[:email3]]

		emails.each do |email|
			#send email
		end

		return true 

	end
end


module Level_2
	def before_render
		@featured_causes=Cause.find_all_by_is_featured(true);
	end

	def on_submit

		
		cause = Cause.find(params[:id])
		unless current_user.causes.include? cause
			current_user.causes << cause
			current_user.save
		end

		return true 

	end
end


class GamesController < ApplicationController
	before_filter :authenticate_user!

	def index new_level=false
		
		@game = current_user.game
		if !@game
			@game = Game.new({level: 0})
			current_user.game=@game
			current_user.save
		end

		setup_module

		if !request.get? && !new_level
			outcome = on_submit
			if outcome== true
				@game.level=@game.level+1
				@game.show_instructions=false #only for the first badge
				@game.save
				@new_badge=Badge.find_by_accomplishment "level_#{@game.level}"
				current_user.badges << @new_badge
				current_user.save
				self.index true
	
			else
				if outcome.is_a? String
					flash[:notice]=outcome
				end
				
			end
		else
			before_render
		end
	

	end

	def setup_module
		self.extend("Level_#{current_user.game.level}".constantize)
	end

end

