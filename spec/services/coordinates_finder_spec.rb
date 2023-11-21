require 'rails_helper'

RSpec.describe CoordinatesFinder, type: :model do
  describe '.call' do

    context 'when place_id is valid' do
      it 'returns a String "Latitude, Longitude"' do
        expect(CoordinatesFinder.call('ChIJ21tyElGij4ARW9ch8F7C87M')).to be_a(String)
      end
    end

    context 'when place_id is not valid' do
        it 'returns nil' do
            expect(CoordinatesFinder.call('!@#$%^&*()')).to eq(nil)
        end
        it 'returns nil' do
          expect(CoordinatesFinder.call('dsf9v88ji949dsf9v88ji949')).to eq(nil)
        end
    end

    context 'when place_id is an empty string' do
      it 'returns an nil' do
        expect(CoordinatesFinder.call('')).to eq(nil)
      end
    end

    context 'when place_id is nil' do
      it 'returns an empty String' do
        expect(CoordinatesFinder.call(nil)).to eq(nil)
      end
    end

  end
end