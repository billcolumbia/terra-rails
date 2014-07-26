class Land < ActiveRecord::Base
  belongs_to :city

  def barren
    self.size - ( self.homes + self.agriculture + self.mines + self.industry )
  end

end
