class PropertiesController < ApplicationController
  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :rooms, :bathrooms,
                                     :pets, :parking_slot, :daily_rate)
  end
end

