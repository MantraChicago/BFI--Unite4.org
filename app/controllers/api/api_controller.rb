class Api::ApiController < ActionController::Base
  protect_from_forgery

  respond_to :json

  def all_data

  	render :json =>{:causes=> Cause.all,
  					:locations =>Location.all,
  					:needs =>Need.all}	
  end

  def index
    @results = base_model.to_s.constantize.all

    render json: @results
  end

  def show
    @api_test = base_model.to_s.constantize.find(params[:id])

    render json: @results
  end

  def new
    @result = base_model.to_s.constantize.new

    render json: @results
  end

  def update
    @result = base_model.to_s.constantize.find(params[:id])

    if @result.update_attributes(params[:api_test])
   
        head :no_content
      else
        ender json: @result.errors, status: :unprocessable_entity 
      end
  end

  def destroy
    @result = base_model.to_s.constantize.find(params[:id])
    @result.destroy

    format.json { head :no_content }
  end
end