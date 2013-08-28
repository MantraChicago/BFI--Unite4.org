class CausePortalController < ApplicationController
  before_filter :cause_edit_auth

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
    #render :action => "profile" 
  end


  def needs

  end

  def account
    profile
  end

  def delete_cause_image
    cause_image=CauseImage.find(params[:id])
    if cause_image.cause == @cause
      cause_image.destroy
      render :nothing => true, :status => 200, :content_type => 'text/html' #could be better
    end
    render :nothing => true, :status => 500, :content_type => 'text/html'
  end

  protected

end