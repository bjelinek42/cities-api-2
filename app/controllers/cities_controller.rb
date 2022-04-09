class CitiesController < ApplicationController
  def index
    city = City.all
    render json: city
  end

  def create
    city = city = City.new({
      name: params[:name], 
      population: params[:population], 
      state: params[:state]})
    city.save
    render json: city
  end

end
