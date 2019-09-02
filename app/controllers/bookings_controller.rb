class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_select][:flight_id])
    end

    def create 
        passenger = Passenger.new(passenger_params)

        if passenger.save
            @booking = Booking.new(flight_id: params[:booking][:id], passenger_id: passenger.id)
            if @booking.save
                PassengerMailMailer.with(passenger: passenger).thank_you_email.deliver_now
                redirect_to @booking 
            else
                flash[:danger] = "There was a problem creating the booking"
                redirect_to root_url
            end
        else
            flash[:danger] = "You must include email and user name"
            redirect_to root_url
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
