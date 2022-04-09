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

  def show
    city = City.find(params[:id])
    render json: city
  end

  def update
    city = City.find(params[:id])
    city.name = params[:name]
    city.state = params[:state]
    city.population = params[:population]
    city.save
    render json: city
  end

  def destroy
    city = City.find(params[:id])
    city.delete
    render json: {message: "city deleted"}
  end
end
