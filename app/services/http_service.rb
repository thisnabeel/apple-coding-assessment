module HttpService
  extend ActiveSupport::Concern

  class_methods do
    attr_accessor :http_client, :api_key

    def setup(http_client = HTTParty, api_key = ENV["GOOGLE_MAPS_API_KEY"])
      @http_client = http_client
      @api_key = api_key
      return {
        http_client: http_client,
        api_key: api_key
      }
    end
  end
end