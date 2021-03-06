class CitiesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  def index
    if params[:name]
    @city = City.where('store LIKE ?', "%#{params[:name]}%")
  else
    @city = City.all
  end


  end

  def show
    @city = City.find(params[:id])
  end

#   def new
#     @city = Film.new
#   end

#   def create
#     @city = Film.create!(city_params)
#       redirect_to "/films/#{@film.id}"
#   end

#   def edit
#      @film = Film.find(params[:id])
#   end

#   def update
#    @film = Film.find(params[:id])
#    @film.update(film_params)
#    redirect_to "/films/#{@film.id}"
#   end
  
#   def delete
#     @film = Film.find(params[:id])
#     @film.destroy

#     redirect_to "/films"
#   end

  private
  def city_params
    params.require(:city).permit(:name, :state, :image)

  end

end
