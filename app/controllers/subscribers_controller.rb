class SubscribersController < ApplicationController
  def new
    @subscribe = Subscriber.new
  end
  
	def create
    @subscribe = Subscriber.new(params[:subscribe])
    if @subscribe.save
      redirect_to root_path, :notice => "You have successfully subscribed" 
    else
      render :action => "new" 
    end

  end

end
