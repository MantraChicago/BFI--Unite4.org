class NeedsController <ApplicationController
  def new
    render "#{ type_of_need }/new", :layout => include_layout?
  end

  protected
    def include_layout?
      params[:partial].nil? || params[:partial] == false
    end
end
