class PerformancesController < ApplicationController

    def date
        @performances = ApiHelper::Api.performance_api(params[:data].to_i)
        @performance_dates =  Performance.get_date(@performances)
    end

    def date_create
        # byebug
        redirect_to(performance_time_path({:date => params[:performance][:date], :show_id => params[:performance][:show_id]}))
    end


    def time
        @performances = ApiHelper::Api.performance_api(params[:show_id].to_i)
        @performance_time = Performance.get_time(@performances, params[:date])
    end

    def time_create
        performances = ApiHelper::Api.performance_api(params[:performance][:show_id].to_i)
        performance_time =  Performance.find_time(performances, params[:performance][:date], params[:performance][:time])
        performance = Performance.find_or_create_by(performance_id: performance_time["PerformanceId"])
        if (performance[:stalls_available] == nil)
            performance[:date_time] = performance_time["PerformanceDate"]
            performance[:stalls_available] = 30
            performance[:lower_available] = 30
            performance[:upper_available] = 30
            performance[:event_id] = params[:performance][:show_id].to_i
            performance[:min_price] = performance_time["MinimumTicketPrice"].ceil
            performance.save
        end
        redirect_to(new_booking_path({:performance_id => performance[:id]}))
    end

    def update 

    end 
end
