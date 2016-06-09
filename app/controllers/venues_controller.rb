class VenuesController < ApplicationController
  def address_to_geo(address)
    require 'open-uri'
    url = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + URI.encode(address)
    begin
      parsed_data = JSON.parse(open(url).read)
      lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
      lng = parsed_data["results"][0]["geometry"]["location"]["lng"]
      return [lat,lng]
    rescue
      lat = nil
      lng = nil
      return [lat,lng]
    end
  end



  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end


  def create
    @venue = Venue.new
    @venue.venue_address = params[:venue_address]
    @venue.venue_name = params[:venue_name]
    @venue.venue_description = params[:venue_description]
    @venue.map_id = params[:map_id]
    @venue.venue_photo = params[:venue_photo]
    latlng = address_to_geo(params[:venue_address])
    @venue.lat = latlng[0]
    @venue.long = latlng[1]

 if @venue.save
      redirect_to "/maps/#{@venue.map_id}", :notice => "Venue created successfully."
else
    render 'new'
end
  end


  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.venue_address = params[:venue_address]
    @venue.venue_name = params[:venue_name]
    @venue.venue_description = params[:venue_description]
    @venue.map_id = params[:map_id]
    @venue.venue_photo = params[:venue_photo]
    latlng = address_to_geo(params[:venue_address])
    @venue.lat = latlng[0]
    @venue.long = latlng[1]

 if @venue.save
      redirect_to "/maps/#{@venue.map_id}", :notice => "Venue created successfully."
else
  redirect_to :back
end
  end

  def destroy
    @venue = Venue.find(params[:id])

    @venue.destroy

    redirect_to :back, :notice => "Venue deleted."
  end
end
