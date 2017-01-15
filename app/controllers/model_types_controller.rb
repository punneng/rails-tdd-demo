class ModelTypesController < ApplicationController
  def index
    @model = Model.find_by(model_slug: params[:model_id])
    render json: @model
  end

  def model_types_price
    render json: {}
  end
end
