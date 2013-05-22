class GamesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@game = current_user.game
		if !@game
			@game = Game.new({level: 0})
			current_user.game=@game
			current_user.save
		end
	end

	def submit_level
		@game = current_user.game
		level = @game.level
		

		outcome=self.send("level_#{level}")

		if outcome ==true
			@game.level=@game.level+1
			@game.save
			
		else
			flash[:notice]=outcome
		end
		
		render 'index'
	end

	private

	def level_0
		'nope'
	end

end
