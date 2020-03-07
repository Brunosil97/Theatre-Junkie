class PagesController < ApplicationController

    def search  
        @shows = ApiHelper::Api.events_api
        @theatres = ApiHelper::Api.venue_api
        if params[:search].blank?  
        #   flash[:notice] = "Your search criteria is invalid. Please try again"
          redirect_to events_path 
        else  
          @parameter = params[:search].downcase  
          @results = @shows.select{|show| show['Name'].downcase.include? @parameter.downcase} 
        end  
      end




end 