class Api::SessionsController < ApplicationController
  def create
    lat = params[:location][:latitude].to_f
    long = params[:location][:longitude].to_f
    results = Geocoder.search([lat, long])
    edition = (results.first.county.match? /Västerås kommun|Stockholms kommun/) ? results.first.county : "Global"
    render json: {
      session: {
        location: {
          latitude: lat,
          longitude: long
        },
          edition: edition 
      } 
    }
  end
end
