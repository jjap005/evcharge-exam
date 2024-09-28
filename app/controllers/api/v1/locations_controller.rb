class Api::V1::LocationsController < ApplicationController
  def index
    city = params[:city].to_i
    locations = Api::V1::LocationService.new(city).call
    render json: locations, status: :ok
  end
end
