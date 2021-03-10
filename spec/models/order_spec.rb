require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category1 = Category.create! name: 'Apparel'

      @product1 =
        Product.create!(
          {
            name: 'Hipster Hat',
            description: Faker::Hipster.paragraph(4),
            image: open_asset('apparel3.jpg'),
            quantity: 4,
            price: 34.49,
            category_id: 1,
          },
        )
      @product2 =
        Product.create!(
          {
            name: 'Hipster Socks',
            description: Faker::Hipster.paragraph(4),
            image: open_asset('apparel4.jpg'),
            quantity: 8,
            price: 25.00,
            category_id: 1,
          },
        )
    end

    xit 'deducts quantity from products based on their line item quantities' do
    end

    xit 'does not deduct quantity from products that are not in the order' do
    end
  end
end
