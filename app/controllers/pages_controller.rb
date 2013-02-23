class PagesController < ApplicationController

  def car_lookup
  end

  def search
    car = Car.find_by_vin(params[:vin])
    respond_to do |format|
      format.json {
        render :json => {
          vin: car.vin,
          make: car.make,
          model: car.model,
          year: car.year,
          value: car.value
        }
      }
    end
  end

  def home
  end

end
