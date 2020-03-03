require "net/http"
require "uri"
require 'json'

class Venue
    attr_accessor :theatres
    def theatre_api
        
        base_uri =  "https://api.londontheatredirect.com/rest/v2/Venues"
        url = URI(base_uri)

        https = Net::HTTP.new(url.host, url.port);
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["Content-Type"] = "application/json"
        request["Api-Key"] = "u3bu7u7mb1qs8oan07mwcdft"

        response = https.request(request)
        @theatres = JSON.parse(response.read_body)
        @theatres = @theatres['Venues']
    end
    
end 