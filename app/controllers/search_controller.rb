class SearchController < ApplicationController

  def index
    request = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=#{ENV["NREL_API_KEY"]}&fuel_type=ELEC,LPG&zip=#{params[:q].to_i}&limit=10&format=JSON&radius=6.0")
    response = JSON.parse(request.body, symbolize_names: true)
    @stations = response[:fuel_stations].map do |station|
      Station.new(station)
    end
  end

end

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
