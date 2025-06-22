require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }

    it 'is invalid with wrong email format' do
      user = build(:user, email: 'bademail')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'is valid with proper email and password' do
      expect(user).to be_valid
    end
  end

  describe 'secure password' do
    it 'requires password_digest' do
      expect(user).to respond_to(:authenticate)
    end
  end
end
