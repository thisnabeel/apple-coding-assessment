class AddressSuggestor
  class << self
    attr_accessor :http_client, :api_key
    
    # Dependency Injection for HTTP client and API key
    def setup(http_client = HTTParty, api_key = ENV["GOOGLE_MAPS_API_KEY"])
      @http_client = http_client
      @api_key = api_key
      return {
        http_client: http_client,
        api_key: api_key
      }
    end

    # Single Responsibility Principle:
    # Orchestrates the workflow of building URL, making the request, and parsing the response.
    def call(address)
      setup unless defined?(@api_key) && defined?(@http_client)

      url = build_api_url(address)
      response = make_request(url)
      parse_response(response)
    end

    private

    # Single Responsibility Principle:
    # Builds the Google Maps API URL based on the given address.
    def build_api_url(address)
      "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=#{address.parameterize}&types=geocode&key=#{@api_key}"
    end

    # Single Responsibility Principle:
    # Makes the HTTP request using the provided HTTP client.
    # Open/Closed Principle:
    # Provides a hook for potential extension by handling HTTParty errors.
    def make_request(url)
      @http_client.get(url)
    rescue HTTParty::Error => e
      # Handle HTTParty errors here
      puts "HTTParty error: #{e.message}"
      nil
    end

    # Single Responsibility Principle:
    # Parses the API response and returns the predictions.
    # Open/Closed Principle:
    # Provides a hook for potential extension by handling JSON parsing errors.
    def parse_response(response)
      return nil unless response&.success?

      JSON.parse(response.body)["predictions"]
    rescue JSON::ParserError => e
      # Handle JSON parsing errors here
      puts "JSON parsing error: #{e.message}"
      nil
    end
  end
end
