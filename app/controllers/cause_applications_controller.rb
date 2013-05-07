class CauseApplicationsController < ApplicationController

  def new
    @cause_application = CauseApplication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @cause_application }
    end
  end

  def success
  	respond_to do |format|
      format.html # new.html.erb
      #format.json { render :json => @cause_application }
    end
  end


  # POST /cause_applications
  # POST /cause_applications.json
  def create
    @cause_application = CauseApplication.new(params[:cause_application])

    respond_to do |format|
      if @cause_application.save
        format.html { render :action => "success" }
        #format.json { render :json => @cause_application, :status => :created, :location => @cause_application }
      else
        format.html { render :action => "new" }
        #format.json { render :json => @cause_application.errors, :status => :unprocessable_entity }
      end
    end
  end

end
