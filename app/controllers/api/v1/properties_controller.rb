class Api::V1::PropertiesController < Api::V1::ApiController
  def index
    @properties = Property.all
    render json: @properties.as_json(except: %i[created_at updated_at property_type_id],
                                     include: { property_type: { only: %i[name] } })
  end

  def show
    @property = Property.find(params[:id])
    render json: @property
  end

  def create
    @property = Property.create(property_params)
    render status: 201, json: @property
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :rooms, :bathrooms,
                                     :pets, :parking_slot, :daily_rate,
                                     :property_type_id, :property_owner_id)
  end
end