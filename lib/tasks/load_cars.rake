require './lib/manual.rb'

task :load_cars => :environment do
  manual = Manual.new()
  manual.extract_data(50) 

#  cars = []
#  manual.cars.each do |car|
#    cars << Car.new(vin: car.vin,
#                   make: car.make,
#                   model: car.model,
#                   trim: car.trim,
#                   year: car.year,
#                   vid: car.vid,
#                   value: car.value)
#    Car.import cars
#  end

  Car.import manual.cars
end
