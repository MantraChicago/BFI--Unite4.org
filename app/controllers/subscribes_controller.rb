class SubscribesController < ApplicationController
	def create
    @subscribe = Subscribe.new(params[:subscribe])
    if @subscribe.save
      redirect_to root_path, :notice => "You have successfully subscribed" 
    else
      render :action => "new" 
    end

  end

end
