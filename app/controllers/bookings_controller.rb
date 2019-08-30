class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_select][:flight_id])
    end

    def create 
        passenger = Passenger.create(passenger_params)
        if passenger.save
            booking = Booking.create(flight_id: params[:booking][:id], passenger_id: passenger.id)
            if booking.save
                redirect_to booking_path(booking.id)
            else
                flash[:danger] = "There was a problem creating the booking"
            end
        else
            flash[:danger] = "There was a problem with user information."
        end
    end

    def show
        @booking = Booking.find(params[:id])
        @flight = Flight.find(@booking.flight_id)
        @passenger = Passenger.find(@booking.passenger_id)
    end

    private

        def passenger_params
            params.require(:passenger).permit(:name, :email)
        end

end
