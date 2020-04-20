require "net/http"
require "uri"
require 'json'
class Performance < ApplicationRecord
    has_many :bookings 
    has_many :users, through: :bookings

    # attr_accessor :perform
def self.get_date(performances)
    performances.map{|performance| performance["PerformanceDate"].to_datetime.strftime("%d %b %Y")}.uniq
end

def self.get_time(performances, date)
    find_date(performances, date).map{|performance| performance["PerformanceDate"].to_datetime.strftime("%H:%M")}
end

def self.find_date(performances, date)
    performances.select{|performance| performance["PerformanceDate"].to_datetime.strftime("%d %b %Y").to_s== date}
end

def self.find_time(performances, date, time)
    find_date(performances, date).find{|perform| perform["PerformanceDate"].to_datetime.strftime("%H:%M").to_s == time}
end

def booking_delete(seating_type, num_of_tickets)
    case seating_type
    when "stalls"
        self[:stalls_available] -= num_of_tickets
    when "lower"
        self[:lower_available] -= num_of_tickets
    when "upper"
        self[:upper_available] -= num_of_tickets
    end
    self.save
end
    
end
