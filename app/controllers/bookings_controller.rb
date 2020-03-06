class BookingsController < ApplicationController

    def index
        @booking_future = @user.get_future_show
        @booking_old = @user.get_previous_show
        @performances = Performance.all
        @shows = ApiHelper::Api.events_api
        @venues = ApiHelper::Api.venue_api

    end 

    def show 
        @booking = Booking.find(params[:id])
        @performance = Performance.find(@booking[:performance_id])
        @shows = ApiHelper::Api.events_api
        @show = @shows.find{|show| show['EventId'] == @performance["event_id"]}
        @venues = ApiHelper::Api.venue_api
        @venue = @venues.find{|venue| venue['VenueId'] == @show['VenueId']}
    end

    def new
        @booking = Booking.new
        @performance = Performance.find(params[:performance_id].to_i)
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
        @performance = Performance.find(@booking[:performance_id])
        @performance.booking_delete(@booking[:seating_type], @booking[:num_of_tickets])
        @booking.destroy
        flash[:notice] = "Booking deleted."
        redirect_to bookings_path
    end

    private 

    def booking_params
        params.require(:booking).permit(:performance_id, :seating_type, :num_of_tickets, :user_id)
    end 
end
