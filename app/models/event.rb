require "net/http"
require "uri"
require 'json'

class Event 
    attr_accessor :shows
    def event_api
        
        base_uri =  "https://api.londontheatredirect.com/rest/v2/Events"
        url = URI(base_uri)

        https = Net::HTTP.new(url.host, url.port);
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["Content-Type"] = "application/json"
        request["Api-Key"] = "u3bu7u7mb1qs8oan07mwcdft"

        response = https.request(request)
        @shows = JSON.parse(response.read_body)
        @shows = @shows['Events']
    end
    
end 