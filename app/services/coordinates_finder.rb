# CoordinatesFinder class
class CoordinatesFinder
  def self.call(place_id)
    url = "https://maps.googleapis.com/maps/api/geocode/json?place_id=#{place_id}&key=#{ENV['GOOGLE_MAPS_API_KEY']}"
    res = HTTParty.get(url)
    
    if res["status"] == "OK"
      coordinates = res["results"][0]["geometry"]["location"]
      return "#{coordinates["lat"]},#{coordinates["lng"]}"
    else
      return nil
    end
  end
end