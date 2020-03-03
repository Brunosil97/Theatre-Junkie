require "net/http"
require "uri"
require 'json'
class Performance < ApplicationRecord
    has_many :bookings 
    has_many :users, through: :bookings

    attr_accessor :perform
    def performance_api(event_id, event_date)
        base_uri = "https://api.londontheatredirect.com/rest/v2/Events/#{event_id}/Performances?dateFrom=#{event_date}"
        url = URI(base_uri)
        https = Net::HTTP.new(url.host, url.port);
        https.use_ssl = true
        request = Net::HTTP::Get.new(url)
        request["Content-Type"] = "application/json"
        request["Api-Key"] = "u3bu7u7mb1qs8oan07mwcdft"
        response = https.request(request)
        response = https.request(request)
        @perform = JSON.parse(response.read_body)
        @perform = @perform['Performances']
    end
end
