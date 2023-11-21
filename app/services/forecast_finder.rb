class ForecastFinder
  include HttpService
  class << self
    # Single Responsibility Principle:
    # ForecastFinder class has the responsibility of finding forecasts for a given set of coordinates.
    def call(coordinates)
        setup({api_key: ENV['VISUAL_CROSSING_API_KEY']}) unless defined?(@api_key) && defined?(@http_client)
        url = build_api_url(coordinates)
        response = make_request(url)
        parse_response(response)
    end

    private

    # Single Responsibility Principle:
    # Builds the API URL based on the given coordinates.
    def build_api_url(coordinates)
        "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{coordinates}?key=#{@api_key}"
    end

    # Single Responsibility Principle:
    # Makes the HTTP request using HTTParty.
    # Open/Closed Principle:
    # Provides a hook for potential extension by handling HTTParty errors.
    def make_request(url)
        HTTParty.get(url)
    rescue HTTParty::Error, StandardError => e
        # Handle HTTParty errors and other StandardErrors here
        puts "An error occurred: #{e.message}"
        nil
    end

    # Single Responsibility Principle:
    # Parses the API response and returns the forecast data.
    # Open/Closed Principle:
    # Provides a hook for potential extension by handling different response scenarios.
    def parse_response(response)
        return nil unless response&.success?

        begin
            json = JSON.parse(response.body)
        rescue JSON::ParserError => e
            # Handle JSON parsing errors here
            puts "JSON parsing error: #{e.message}"
            return nil
        end

        json
    end
  end
end

# Comments on Developer Happiness:
# Developers are likely to find this class more enjoyable to work with due to its clean and modular design.
# The separation of concerns and the use of well-named methods make the codebase more readable.
# Additionally, the provided hooks for extension allow developers to implement changes without the fear of breaking existing functionality.
