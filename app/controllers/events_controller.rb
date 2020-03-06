
class EventsController < ApplicationController

    def index 
        @shows = ApiHelper::Api.events_api
        # @shows.paginate(page: params[:page], per_page: 10)
        
    end 

    def show
        @shows = ApiHelper::Api.events_api
        @show = @shows.find{|show| show['EventId'] == params[:id].to_i} 
        if @show
            @theatres = ApiHelper::Api.venue_api
            @theatre = @theatres.find {|theatre| theatre['VenueId'] == @show['VenueId']}
        else
            flash[:notice] = "Oops someting went wrong with that show"
            redirect_to events_path
        end
    end
end
