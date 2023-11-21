require 'rails_helper'

RSpec.describe AddressSuggestor, type: :model do
  describe '.call' do

    context 'when address is appropriate' do
      it 'returns an Array of suggestions' do
        expect(AddressSuggestor.call('123 Main St.')).to be_a(Array)
      end
    end

    context 'when address is an empty string' do
      it 'returns an empty Array' do
        expect(AddressSuggestor.call('')).to eq([])
      end
    end

    context 'when address contains special characters' do
      it 'returns an Array of suggestions' do
        expect(AddressSuggestor.call('!@#$%^&*()')).to be_a(Array)
      end
    end

    context 'when address contains only numbers' do
      it 'returns an Array of suggestions' do
        expect(AddressSuggestor.call('12345')).to be_a(Array)
      end
    end

    context 'when address is nil' do
      it 'returns an empty Array' do
        expect(AddressSuggestor.call(nil)).to eq([])
      end
    end

    context 'when address is extremely long' do
      it 'returns an Array of suggestions' do
        long_address = 'a' * 1000
        expect(AddressSuggestor.call(long_address)).to be_a(Array)
      end
    end


  end
end