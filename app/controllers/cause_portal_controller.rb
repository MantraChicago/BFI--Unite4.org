class CausePortalController < ApplicationController
  before_filter :authenticate_user! #TODO need to make this more specific
  before_filter :get_cause

  def home

  end

  def profile

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