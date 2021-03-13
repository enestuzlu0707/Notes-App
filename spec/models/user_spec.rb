require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with email and password' do
    user = create(:user)
    expect(user).to be_valid
  end

  context 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of :email }
      it { is_expected.to validate_presence_of :password }
    end
  end
end