require 'rails_helper'

RSpec.describe AddressSuggestor, type: :model do
  describe '.setup' do
    let(:http_client_double) { double('HTTParty') }
    let(:api_key) { 'fake_api_key' }

    context 'when setup is called with default parameters' do
      it 'sets up HTTP client and API key using default values' do
        setup = AddressSuggestor.setup
        expect(setup[:http_client]).not_to be_nil
        expect(setup[:api_key]).to be_a(String)
      end
    end

    context 'when setup is called with custom parameters' do
      it 'sets up HTTP client and API key with custom values' do
        AddressSuggestor.setup(http_client_double, api_key)

        expect(AddressSuggestor.http_client).to eq(http_client_double)
        expect(AddressSuggestor.api_key).to eq(api_key)
      end
    end
  end
end