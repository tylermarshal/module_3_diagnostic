class NrelService

  attr_reader :location

  def initialize(location)
    @location = location
  end

  def request
    get_nrel[:fuel_stations].map do |station|
      Station.new(station)
    end
  end

  def get_nrel
    request = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&fuel_type=ELEC,LPG&location=#{location}&limit=10&radius=6.0")
    JSON.parse(request.body, symbolize_names: true)
  end

end
