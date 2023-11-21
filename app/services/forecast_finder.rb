class ForecastFinder
    def self.call(coordinates)
        url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{coordinates}?key=#{ENV["VISUAL_CROSSING_API_KEY"]}"
        begin
            response = HTTParty.get(url)
            json = JSON.parse(response.body)
        rescue HTTParty::Error, StandardError => e
            puts "An error occurred: #{e.message}"
            json = nil
        end
        return json
    end
end