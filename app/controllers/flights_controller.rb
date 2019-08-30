class FlightsController < ApplicationController
    def new
    end

    def index
        flight_params = params[:flight_params]
        if !flight_params.nil?
            @flights = Flight.where(start_id: flight_params[:start_id], finnish_id: flight_params[:finnish_id], date: flight_params[:date])
        end
    end
end

