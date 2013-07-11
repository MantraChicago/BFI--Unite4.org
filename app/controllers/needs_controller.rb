class NeedsController <ApplicationController
  def new
    @need=need
    render "#{ type_of_need }/new", :layout => include_layout?
  end

  protected
    def need
      Need.find(params[:need_id]) if params[:need_id]
    end

    def cause
      @cause ||= Cause.find_by_slug(params[:cause_slug])
    end

    def type_of_need
      need.present? ? need.type_of_need : params[:type_of_need]
    end

    def include_layout?
      params[:partial].nil? || params[:partial] == false
    end
end
