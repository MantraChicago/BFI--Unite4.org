class NeedsController <ApplicationController
  def show
    @need=Need.find(params[:id])
  end
end