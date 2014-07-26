class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(required_city_params)
    respond_to do |format|
      if @city.save
        format.html  { redirect_to(cities_path, :notice => 'City was successfully created.') }
      else
        format.html  { render :action => "new" }
      end
    end
  end

  private
    # Assignable attrs
    def required_city_params
      params.require(:city).permit(:name)
    end

end
