class Station

  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(response)
    @name = response[:station_name]
    @address = response[:street_address]
    @fuel_type = response[:fuel_type_code]
    @distance = "Within 6 Miles"
    @access_times = response[:access_days_time]
  end
end
