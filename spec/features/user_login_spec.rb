require 'rails_helper'

RSpec.feature 'UserLogins', type: :feature, js: true do
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

    fill_in 'email', with: 'alice@wonderland.com'
    fill_in 'password', with: 'password'

    find_button('Login').click

    sleep 1

    expect(find('nav ul.navbar-right')).to have_text 'Logout'
  end
end
