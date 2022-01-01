require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model.User' do
    let(:user) { FactoryBot.create :user }

    context 'validates field using fixtures' do
      it 'email must be valid' do
        expect(user).to be_valid
      end
      it 'email must not be valid' do
        user.email = nil
        expect(user).to_not be_valid
      end
    end
  end
end
