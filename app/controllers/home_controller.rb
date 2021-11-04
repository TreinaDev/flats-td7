class HomeController < ApplicationController
  def index
    @properties = Property.all
    @property_types = PropertyType.all
  end
end
