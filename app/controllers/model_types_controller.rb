class ModelTypesController < ApplicationController
  before_action :authenticate_with_token!
  before_action :load_model
  def index
    render json: @model
  end

  def price
    return render_bad_request unless params[:base_price].present?
    model_type = @model.model_types.find_by(model_type_slug: params[:model_type_slug])
    return render_not_found unless model_type.present?
    model_type.base_price = params[:base_price].to_i

    render json: model_type
  end

  private
  def load_model
    @model = Model.find_by(model_slug: params[:model_slug])
    render_not_found unless @model
  end
end
