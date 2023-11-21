require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe '#forecast' do
    context 'with valid place_id' do
      let(:valid_place_id) { 'ChIJ674hC6Y_WBQRujtC6Jay33k' }
      let(:coordinates) { '30.0444196,31.2357116' }
      let(:forecast_stub) do
        {
            key: ENV['VISUAL_CROSSING_API_KEY'],
            coordinates: coordinates,
            forecast: {
              summary: 'Sunny',
              temperature: 25
            }
        }
      end

      before do
        allow(CoordinatesFinder).to receive(:call).with(valid_place_id).and_return(coordinates)

        # Stub the HTTP request using WebMock
        stub_request(:get, /weather.visualcrossing.com/).
          with(query: hash_including(key: ENV['VISUAL_CROSSING_API_KEY'])).
          to_return(
            body: forecast_stub.to_json,
            headers: { 'Content-Type': 'application/json' }
          )

        get :forecast, params: { place_id: valid_place_id }, format: :html
      end

    end

  end
end