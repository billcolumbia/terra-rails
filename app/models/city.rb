class City < ActiveRecord::Base
  has_one :land
  after_create :create_land

  def land
    Land.find(self.land_id)
  end

  private
    DEFAULT_SIZE = 500

    def create_land
      new_land = Land.create(:size =>  DEFAULT_SIZE)
      self.land_id = new_land.id
      self.save
    end

end
