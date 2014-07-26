class City < ActiveRecord::Base
  has_one :land
  has_one :resources
  after_create :create_land, :create_resources

  # Access city's land easily
  def land
    Land.find(self.land_id)
  end

  # Access city's land easily
  def resources
    Resources.find(self.resources_id)
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

    def create_resources
      # Create new resources for the city
      new_resources = Resources.create()

      # Associate foreign key
      self.resources_id = new_resources.id
      self.save

      # Generate starting resources
      new_resources.update_attributes(
        :cash => 15000000,
        :materials => 5000,
        :food => 2500
      )
      new_resources.save
    end

end
