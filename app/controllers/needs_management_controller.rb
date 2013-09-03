class NeedsManagementController < ApplicationController
  before_filter :cause_edit_auth
  before_filter :get_need_type

  def get_need_type
    @need_type= params[:need_type] || Need.find(params[:id]).type
  end

  def edit
    #@submit_url ="/causes/#{params[:cause_slug]}/edit/need_modal"
    @need= Need.find(params[:id])
    render "needs/#{@need_type.underscore.pluralize}/create_modal",:layout => false
  end

  def new
    
    #@submit_url ="/causes/#{params[:cause_slug]}/edit/need_modal"
    @need = @need_type.classify.constantize.new()
    render "needs/#{@need_type}/create_modal",:layout => false
  end

  def update
    @need= Need.find(params[:id])
    need_key = (params[@need_type.underscore]) ? @need_type.underscore : 'need' #kinda a hack
    if params[need_key][:is_primary]=='true' #temp
      demote_all_needs
      @need.end_date = Time.zone.now + 1.month
      @need.save

    end
    
    @need.update_attributes(params[need_key])
    respond_to do |format|
      format.json { render :json => @need, :status => 200 }
      format.html { redirect_to "/causes/#{@cause.slug}/edit/needs", :notice => 'Need updated'}
    end
  end

  def create
    @need = @need_type.classify.constantize.new()
    @need.cause_id =@cause.id
    @need.is_active=true
    @need.type=@need.class.to_s
    @need.update_attributes(params[@need_type.underscore])
    redirect_back_to_cause_portal
  end

  protected

  def redirect_back_to_cause_portal
    redirect_to "/causes/#{@cause.slug}/edit/needs", :notice => 'Need added'
  end

  def demote_all_needs
    @cause.needs.each do |need|
      need.is_primary=false
      need.save
    end
  end
end