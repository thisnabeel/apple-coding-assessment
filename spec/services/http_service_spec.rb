# spec/services/http_service_spec.rb
require 'rails_helper'

class DummyClass
  include HttpService
end

RSpec.describe HttpService do
  let(:dummy_instance) { DummyClass }

  it 'should respond to setup' do
    expect(dummy_instance).to respond_to(:setup)
  end

  describe '#setup' do
    it 'sets up http_client and api_key' do
      options = {
        http_client: double('HTTParty'),
        api_key: 'your_api_key'
      }

      result = dummy_instance.setup(options)

      expect(dummy_instance.http_client).to eq(options[:http_client])
      expect(dummy_instance.api_key).to eq(options[:api_key])
      expect(result).to eq({ http_client: options[:http_client], api_key: options[:api_key] })
    end
  end
end