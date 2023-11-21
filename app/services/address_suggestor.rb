class AddressSuggestor
    def self.call(address)
        url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=#{address.parameterize}&types=geocode&key=#{ENV["GOOGLE_MAPS_API_KEY"]}"
        response = HTTParty.get(url)
        return JSON.parse(response.body)["predictions"]
    end
end