class WeatherController < ApplicationController
  def forecast
    coordinates = CoordinatesFinder.call(params[:place_id])

    cache_key = "forecast/#{params[:place_id]}"
    if Rails.cache.exist?(cache_key)
      # Data exists in the cache
      forecast = Rails.cache.read(cache_key)
      cached = true
    else
      # Data does not exist in the cache; fetch and cache it
      forecast = ForecastFinder.call(coordinates)
      cached = false
      Rails.cache.write(cache_key, forecast, expires_in: 30.minutes)
    end

    render json: render_to_string(partial: 'weather/forecast', locals: { forecast: forecast, cached: cached })
  end
end