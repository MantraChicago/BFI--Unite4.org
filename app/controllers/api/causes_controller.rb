class Api::CausesController < Api::ApiController
  

  # GET /api/needs
  # GET /api/needs.json
  def index
    @json_data = Cause.all
    render_json
  end	

  # GET /api/needs/1
  # GET /api/needs/1.json
  def show
  	
    @json_data = Cause.find(params[:id])
    render_json
  end

end
