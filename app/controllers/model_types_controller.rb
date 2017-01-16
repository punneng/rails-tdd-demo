class ModelTypesController < ApplicationController
  before_action :authenticate_with_token!
  before_action :load_model
  def index
    render json: @model
  end

  def price
    model_type = @model.model_types.find_by(model_type_slug: params[:model_type_slug])
    model_type.base_price = params[:total_price].to_i

    render json: model_type
  end

  private
  def load_model
    @model = Model.find_by(model_slug: params[:model_slug])
  end
end
