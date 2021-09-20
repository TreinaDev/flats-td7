class PropertiesController < ApplicationController
  def show
    id = params[:id]
    @property = Property.find(id)
  end
end