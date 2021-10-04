class PropertiesController < ApplicationController
  before_action :authenticate_property_owner!, only: [:new, :create]

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.property_owner = current_property_owner
    if @property.save
      redirect_to @property
    else
      render :new
    end
  end

  def my_properties
    # Filtrar somente os imóveis do property_owner logado
    @properties = current_property_owner.properties
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :rooms, :bathrooms,
                                     :pets, :parking_slot, :daily_rate,
                                     :property_type_id)
  end
end

