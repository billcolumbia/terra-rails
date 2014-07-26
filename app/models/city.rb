class City < ActiveRecord::Base
  has_one :land
  after_create :create_land

  # Access city's land easily
  def land
    Land.find(self.land_id)
  end

  private
    # Cities land will start at this size
    DEFAULT_SIZE = 500

    def create_land
      # Create new land for the city
      new_land = Land.create(:size =>  DEFAULT_SIZE)

      # Associate foreign key
      self.land_id = new_land.id
      self.save

      # Create default land assignments
      new_land.update_attributes(
        :homes => new_land.size * 0.4,
        :agriculture => new_land.size * 0.1,
        :mines => new_land.size * 0.3,
        :industry => new_land.size * 0.2
      )

      new_land.save
    end

end
