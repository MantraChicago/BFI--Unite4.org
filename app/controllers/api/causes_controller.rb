class Api::CausesController < Api::ApiController

  def index
    @causes = Cause.scoped
    respond_with(@causes)
  end

  # GET /api/needs/1
  # GET /api/needs/1.json
  def show

    @json_data = Cause.find(params[:id])
    render_json
  end

end
