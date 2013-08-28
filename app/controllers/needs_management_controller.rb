class NeedsManagementController < ApplicationController
  before_filter :cause_edit_auth
  before_filter :get_need_type

  def get_need_type
    @need_type= params[:need_type]
  end

  def new
    
    @submit_url ="/causes/#{params[:cause_slug]}/edit/need_modal"
    @need = @need_type.classify.constantize.new()

    render "needs/#{@need_type}/create_modal",:layout => false
  end

  def create
    @need = @need_type.classify.constantize.new()
    @need.cause_id =@cause.id
    @need.is_active=true
    @need.type=@need.class.to_s
    @need.update_attributes(params[@need_type])
    binding.pry
  end
end