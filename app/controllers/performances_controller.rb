class PerformancesController < ApplicationController

    
    def index 
       @performances = ApiHelper::Api.performance_api(params[:data].to_i)
    end 

    def edit 

    end 

    def update 

    end 
end
