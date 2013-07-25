class CauseApplicationsController < ApplicationController

  def new
    @cause_application = CauseApplication.new 
  end

  def create
    
    @cause_application = CauseApplication.new(params[:cause_application])
    
    if @cause_application.save
      
      redirect_to root_path, :notice => "Thank you for your interest in Unite4:Good! One of our Cause Representatives will call you to gather a few more pieces of information in the coming days" 
    else
      render :action => "new" 
    end

  end

end
