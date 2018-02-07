class NrelService

  attr_reader :location

  def initialize(location)
    @location = location
  end

  def request
    request = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&fuel_type=ELEC,LPG&location=#{location}&limit=10&radius=6.0")
    response = JSON.parse(request.body, symbolize_names: true)
    @stations = response[:fuel_stations].map do |station|
      Station.new(station)
    end
  end

end
