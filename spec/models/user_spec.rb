require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should save when all fields are provided' do
    @user =
      User.new(
        first_name: 'Rebecca',
        last_name: 'Chen',
        email: 'rebecca.chen@gmail.com',
        password: 'password',
        password_confirmation: 'password',
      ).save

    expect(@user).to eq(true)
  end

  describe 'Validations' do
  end
end
