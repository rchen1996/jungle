require 'rails_helper'

RSpec.feature 'UserLogins', type: :feature do
  before :each do
    @user =
      User.create! first_name: 'Alice',
                   last_name: 'Wonderland',
                   email: 'alice@wonderland.com',
                   password: 'password',
                   password_confirmation: 'password'
  end

  scenario 'They can login' do
    # ACT
    visit login_path

    save_screenshot
  end
end
