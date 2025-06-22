require 'rails_helper'

RSpec.describe JsonWebToken, type: :service do
  let(:payload) { { user_id: 123 } }

  describe '.encode' do
    it 'returns a JWT token as a string' do
      token = described_class.encode(payload)
      expect(token).to be_a(String)
    end
  end

  describe '.decode' do
    context 'with valid token' do
      it 'decodes the token and returns original payload' do
        token = described_class.encode(payload)
        decoded = described_class.decode(token)

        expect(decoded[:user_id]).to eq(123)
        expect(decoded).to have_key(:exp)
      end
    end

    context 'with invalid token' do
      it 'raises a StandardError with message "Invalid token"' do
        expect do
          described_class.decode('this.is.invalid')
        end.to raise_error(StandardError, 'Invalid token')
      end
    end
  end
end
