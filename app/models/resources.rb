class Resources < ActiveRecord::Base

  def self.create_resources(new_city)
    # Create new resources for the city
    new_resources = Resources.create()

    # Associate foreign key
    new_city.resources_id = new_resources.id
    new_city.save

    # Generate starting resources
    new_resources.update_attributes(
      :cash => 15000000,
      :materials => 5000,
      :food => 2500
    )
    new_resources.save
  end

end
