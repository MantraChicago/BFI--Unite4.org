=begin
require 'spec_helper'

describe GamesController do
	it "Game should route to Games controller" do
		{ :get => "/game" }.should route_to(:controller => "games", :action => "index")
	end

	it "A game should show instructions on the first load" do
		#{ :get => "/game" }
		get 'index'
		game = assigns(:game)
		game.show_instructions.should_be true
	end
	
end
=end