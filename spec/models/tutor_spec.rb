require 'rails_helper'

RSpec.describe Tutor, type: :model do
  subject(:tutor) { build(:tutor, course: course) }

  let(:course) { create(:course) }

  describe 'validations' do
    it { is_expected.to belong_to(:course) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }

    it 'is invalid with incorrect email format' do
      tutor = build(:tutor, email: 'invalid-email')
      expect(tutor).not_to be_valid
      expect(tutor.errors[:email]).to include('is invalid')
    end

    it 'is valid with proper attributes' do
      expect(tutor).to be_valid
    end
  end
end
