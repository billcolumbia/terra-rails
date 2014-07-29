class Land < ActiveRecord::Base
  belongs_to :city

  # Land will start at this size
  def self.DEFAULT_SIZE
    return 500
  end

  def self.create_land(new_city)
   # Create new land for the city
    new_land = Land.create(:size => self.DEFAULT_SIZE)

    # Associate foreign key
    new_city.land_id = new_land.id
    new_city.save

    # Create default land assignments
    new_land.update_attributes(
      :homes => new_land.size * 0.4,
      :agriculture => new_land.size * 0.1,
      :mines => new_land.size * 0.3,
      :industry => new_land.size * 0.2
    )

    new_land.save
  end

  # Calculate unused land
  def barren
    self.size - ( self.homes + self.agriculture + self.mines + self.industry )
  end

end
