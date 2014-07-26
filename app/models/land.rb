class Land < ActiveRecord::Base
  belongs_to :city

  # Calculate unused land
  def barren
    self.size - ( self.homes + self.agriculture + self.mines + self.industry )
  end

end
