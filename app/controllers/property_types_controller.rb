class PropertyTypesController < ApplicationController

  def show
    id = params[:id]
    @property_type = PropertyType.find(id)
  end
end