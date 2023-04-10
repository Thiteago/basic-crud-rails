require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { described_class.new(name: 'Example User', email: 'pepino@gmail.com') }

  describe '#valid?' do
    it 'is valid' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user.name = '     '
      expect(user).not_to be_valid
    end

    it 'is invalid without an email' do
      user.email = '     '
      expect(user).not_to be_valid
    end

    it 'is invalid with a name that is too long' do
      user.name = 'a' * 51
      expect(user).not_to be_valid
    end

    it 'is invalid with an email that is too long' do
      user.email = 'a' * 244 + '@example.com'
      expect(user).not_to be_valid
    end
  end
end