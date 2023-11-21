require 'rails_helper'

RSpec.describe AddressController, type: :controller do
  describe '#suggestions' do
    context 'with valid address' do
      let(:valid_address) { '40708 Grimmer Blvd' }
      let(:stub) {[
            {"description"=>"40708 Grimmer Terrace, Fremont, CA, USA"},
            {"description"=>"40708 South Grimmer Boulevard, Fremont, CA, USA"},
        ]}

      before do
        allow(AddressSuggestor).to receive(:call).with(valid_address).and_return(stub)
        get :suggestions, params: { address: valid_address }, format: :html
      end

      it 'calls AddressSuggestor with the provided address' do
        expect(AddressSuggestor).to have_received(:call).with(valid_address)
      end

    end
  end
end