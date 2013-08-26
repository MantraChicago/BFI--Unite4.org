class CausePortalController < ApplicationController
  before_filter :authenticate_user! #TODO need to make this more specific
  before_filter :get_cause

  def home

  end

  def profile
    params[:cause] ||= {}
    params[:cause][:cause_type_ids] ||= []

    if not request.get? and @cause.update_attributes(params[:cause]) 
      if params[:picture]
        CauseImage.create(:picture => params[:picture], :cause_id => @cause.id)
      end
      flash[:notice] ="You have successfully updated your cause" 
    end
    render :action => "profile" 
  end

  def needs

  end

  def account

  end

  protected

  def get_cause
    @cause= Cause.find(params[:cause_slug])
  end
end