class Api::V1::LocationService
  def initialize(city = nil)
    @city = city
  end

  def call
    return [] if @city.nil?
    fetch_active_locations
  end

  private

  def fetch_active_locations
    Location.by_city(@city).active
  end
end
