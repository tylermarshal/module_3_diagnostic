class SearchController < ApplicationController

  def index
    @stations = NrelService.new(params[:q].to_i).request
  end

end
