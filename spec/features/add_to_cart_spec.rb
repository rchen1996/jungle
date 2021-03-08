require 'rails_helper'

RSpec.feature 'AddToCarts', type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario 'They can add a product to the cart' do
    # ACT
    visit root_path

    expect(page).to have_css 'article.product', count: 10

    first('button i.fa-shopping-cart').click

    sleep 1

    expect(find('nav ul.navbar-right')).to have_text 'My Cart (1)'
  end
end
