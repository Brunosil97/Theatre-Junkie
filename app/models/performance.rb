require "net/http"
require "uri"
require 'json'
class Performance < ApplicationRecord
    has_many :bookings 
    has_many :users, through: :bookings

    # attr_accessor :perform
    
end
