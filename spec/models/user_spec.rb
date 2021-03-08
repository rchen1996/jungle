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
    it 'should validate password and password confirmation fields' do
      @user =
        User.create(
          first_name: 'Rebecca',
          last_name: 'Chen',
          email: 'rebecca.chen@gmail.com',
          password: nil,
          password_confirmation: nil,
        )

      expect(@user.errors.full_messages).to include("Password can't be blank")
      expect(@user.errors.full_messages).to include(
        "Password confirmation can't be blank",
      )
    end

    it 'should validate password and password confirmation fields match' do
      @user =
        User.create(
          first_name: 'Rebecca',
          last_name: 'Chen',
          email: 'rebecca.chen@gmail.com',
          password: 'password',
          password_confirmation: 'notpassword',
        )

      expect(@user.errors.full_messages).to include(
        "Password confirmation doesn't match Password",
      )
    end

    it 'should validate that emails are unique' do
      @user =
        User.new(
          first_name: 'Rebecca',
          last_name: 'Chen',
          email: 'test@test.com',
          password: 'password',
          password_confirmation: 'password',
        ).save

      @user2 =
        User.create(
          first_name: 'John',
          last_name: 'Smith',
          email: 'TEST@TEST.com',
          password: 'password',
          password_confirmation: 'password',
        )

      expect(@user).to eq(true)

      # expect(@user2).to eq(false)
      expect(@user2.errors.full_messages).to include(
        'Email has already been taken',
      )
    end
  end
end
