class CoordinatesFinder
  include HttpService
  class << self

    # Single Responsibility Principle:
    # CoordinatesFinder class has the responsibility of finding coordinates for a given place_id.
    def call(place_id = nil)
      return nil if !place_id || place_id.length < 4 || !!"#{place_id}"[/[!@#$%^&*()]/]
      setup({api_key: ENV['GOOGLE_MAPS_API_KEY']}) unless defined?(@api_key) && defined?(@http_client)
      url = build_api_url(place_id)
      res = make_request(url)
      parse_response(res)
    end

    private

    # Single Responsibility Principle:
    # Builds the Google Maps API URL based on the given place_id.
    def build_api_url(place_id)
      "https://maps.googleapis.com/maps/api/geocode/json?place_id=#{place_id}&key=#{@api_key}"
    end

    # Single Responsibility Principle:
    # Makes the HTTP request using HTTParty.
    # Open/Closed Principle:
    # Provides a hook for potential extension by handling HTTParty errors.
    def make_request(url)
      HTTParty.get(url)
    rescue HTTParty::Error => e
      # Handle HTTParty errors here
      puts "HTTParty error: #{e.message}"
      nil
    end

    # Single Responsibility Principle:
    # Parses the API response and returns the coordinates if the status is "OK."
    # Open/Closed Principle:
    # Provides a hook for potential extension by handling different status cases.
    def parse_response(response)
      return nil unless response&.success?

      if response["status"] == "OK"
        coordinates = response["results"][0]["geometry"]["location"]
        return "#{coordinates["lat"]},#{coordinates["lng"]}"
      else
        return nil
      end
    end
  end
end

# Comments on Developer Happiness:
# Developers are likely to find this class more enjoyable to work with due to its clean and modular design.
# The separation of concerns and the use of well-named methods make the codebase more readable.
# Additionally, the provided hooks for extension allow developers to implement changes without the fear of breaking existing functionality.
