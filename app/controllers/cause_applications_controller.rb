class CauseApplicationsController < ApplicationController

  def new
    @cause_application = CauseApplication.new 
  end

  def create
    
    @cause_application = CauseApplication.new(params[:cause_application])
    
    if @cause_application.save
      
      redirect_to root_path, :notice => "You have successfully applied to be cause" 
    else
      render :action => "new" 
    end

  end

end
