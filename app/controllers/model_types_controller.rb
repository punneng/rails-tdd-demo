class ModelTypesController < ApplicationController
  def index
    @model = Model.find_by(model_slug: params[:model_slug])
    render json: @model
  end

  def price
    render json: {}
  end
end
