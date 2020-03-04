class EventsController < ApplicationController

    def index 
        @shows = ApiHelper::Api.events_api
    end 

    def show
        @shows = ApiHelper::Api.events_api
        @show = @shows.find{|show| show['EventId'] == params[:id].to_i} 
    end
end
