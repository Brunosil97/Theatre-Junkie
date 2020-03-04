class BookingsController < ApplicationController

    def index 
        @bookings = Booking.all
    end 

    def show 
        @booking = Booking.find(params[:id])
    end 

    def new 

    end 

    def create 

    end

    private 

    def booking_params 
        # params.require(:booking).permit()
    end 
end
