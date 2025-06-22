require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { build(:course) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(100) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:tutors).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:tutors) }
  end
end
