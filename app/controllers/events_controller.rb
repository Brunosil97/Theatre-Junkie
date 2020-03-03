class EventsController < ApplicationController

    def index 
        @shows = ApiHelper::Api.events_api
    end 

    def show
        
    end
end
