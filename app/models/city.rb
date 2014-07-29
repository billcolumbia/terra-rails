class City < ActiveRecord::Base
  has_one :land
  has_one :resources
  after_create do
    Land.create_land(self)
    Resources.create_resources(self)
  end

  def self.update_resources
    City.all.each do |city|
      new_cash = city.resources.cash + 111111
      city.resources.update_attributes(:cash => new_cash)
      city.resources.save
    end
  end

  # Access city's land easily
  def land
    Land.find(self.land_id)
  end

  # Access city's resources easily
  def resources
    Resources.find(self.resources_id)
  end

end
