class ModalsController <ApplicationController
  layout false
  def cause
    @cause= Cause.find_by_id(params[:id])
  end

  def login

  end

end