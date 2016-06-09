class MapsController < ApplicationController


  def index

    @maps = Map.all
  end

  def show
    @map = Map.find(params[:id])
  @venue = Venue.new
  @i = 1
  @b = 1
  @array = []
  @urlarray = []
  @x = 0
  end

  def new
@map =   Map.new
  end


  def create
    @map = Map.new
    @map.map_description = params[:map_description]
    @map.user_id = params[:user_id]
    @map.map_image = params[:map_image]
    @map.map_name = params[:map_name]

    if @map.save
      redirect_to "/maps/#{@map.id}", :notice => "Map created successfully."
    else
      render 'new'
    end
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Map.find(params[:id])

    @map.map_description = params[:map_description]
    @map.user_id = params[:user_id]
    @map.map_image = params[:map_image]
    @map.map_name = params[:map_name]

    if @map.save
      redirect_to "/maps", :notice => "Map updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @map = Map.find(params[:id])

    @map.destroy

    redirect_to "/maps", :notice => "Map deleted."
  end
end
