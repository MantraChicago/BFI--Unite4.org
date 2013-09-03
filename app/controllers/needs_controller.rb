class NeedsController <ApplicationController
  def new
    @need=Need.find(params[:need_id])
    #@cause=need.cause
    render "#{ @need.type.underscore }/new", :layout => false
  end

end
