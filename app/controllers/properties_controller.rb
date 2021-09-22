class PropertiesController < ApplicationController
  def show
    id = params[:id]
    @property = Property.find(id)
  end

  def new
    @property = Property.new
  end

  def create
    # Strong Parameters
    p = Property.create(params.require(:property).permit(:title, :description, :rooms, :bathrooms, :pets, :parking_slot, :daily_rate))

    #prop = Property.create(title: params[:property][:title], description: params[:property][:description], 
    #               rooms: params[:property][:rooms], bathrooms: params[:property][:bathrooms],
    #               daily_rate: params[:property][:daily_rate], pets: params[:property][:pets],
    #               parking_slot: params[:property][:parking_slot])

    redirect_to p
  end
end

