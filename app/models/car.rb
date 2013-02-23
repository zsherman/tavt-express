class Car < ActiveRecord::Base
  attr_accessible :make, :model, :trim, :value, :vid, :vin, :year, :id
end
