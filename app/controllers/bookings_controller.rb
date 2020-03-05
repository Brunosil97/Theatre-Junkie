class BookingsController < ApplicationController

    def index 
        @bookings = Booking.all
    end 

    def show 
        @booking = Booking.find(params[:id])
    end 

    def new
        @booking = Booking.new
    end 

    def create 
        booking = Booking.new(booking_params)
        performance = Performance.find_by(id: params[:booking][:performance_id].to_i)
        if booking.check_tickets
            booking.get_price(params[:booking][:seating_type], performance, params[:booking][:num_of_tickets].to_i)
            if booking.valid?
                performance["#{booking[:seating_type]}_available"] -= booking[:num_of_tickets]
                performance.save
                booking.save
                redirect_to "/bookings/#{booking[:id]}"
            end
        else
            flash[:errors] = 'Not enough available tickets'
            redirect_to(new_booking_path({:performance_id => booking[:performance_id]}))
        end
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        flash[:notice] = "Booking deleted."
        redirect_to bookings_path
    end

    private 

    def booking_params
        params.require(:booking).permit(:performance_id, :seating_type, :num_of_tickets, :user_id)
    end 
end
