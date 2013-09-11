class NeedsController < ApplicationController
  before_filter :cause_edit_auth
  before_filter :get_need_type

  def get_need_type
    @need_type= params[:need_type] || Need.find(params[:id]).type
  end

  def edit
    @need= Need.find(params[:id])
    render "needs/#{@need_type.underscore.pluralize}/create_modal",:layout => false
  end

  def new
    @need = @need_type.classify.constantize.new()
    render "needs/#{@need_type}/create_modal",:layout => false
  end

  def update
    @need= Need.find(params[:id])
    need_key = (params[@need_type.underscore]) ? @need_type.underscore : 'need' #kinda a hack

    params[need_key][:cause_id]=@cause.id
    setup_primary_need(@need) if @need.is_primary
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
    @need.update_attributes(params[@need_type.underscore.singularize])
    
    setup_primary_need(@need) if @need.is_primary
    
    redirect_back_to_cause_portal
  end

  protected

  def setup_primary_need need
    
    
    if params[:time_amount] && !params[:time_amount].empty?
      demote_all_needs
      time_future=params[:time_amount].to_i.send(params[:time_unit].downcase)
      need.reload
      need.end_date = Time.zone.now + time_future
      need.is_primary=true
      need.save
    end
    
  end

  def redirect_back_to_cause_portal
    redirect_to "/causes/#{@cause.slug}/edit/needs", :notice => 'Need added'
  end

  def demote_all_needs
    @cause.needs.all.each do |need|
      need.is_primary=false
      need.save
    end
  end
end