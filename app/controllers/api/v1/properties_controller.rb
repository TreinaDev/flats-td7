class Api::V1::PropertiesController < ActionController::API
  def index
    @properties = Property.all
    render json: @properties.as_json(except: %i[created_at updated_at property_type_id],
                                     include: { property_type: { only: %i[name] } })
  end

  def show 
    @property = Property.find(params[:id])
    render json: @property
  end
end