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

    it 'deducts quantity from products based on their line item quantities' do
      # initialize order
      @order =
        Order.new(
          email: 'alice@wonderland.com',
          total_cents: 8449,
          stripe_charge_id: 1_234_567_890,
        )

      # build line items on order
      @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: @product2.price,
        total_price: @product2.price * 2,
      )

      @order.line_items.new(
        product: @product1,
        quantity: 1,
        item_price: @product1.price,
        total_price: @product1.price * 1,
      )

      @order.save!

      # reload products to have updated quantities
      @product1.reload
      @product2.reload

      # assert quantity values
      expect(@product2.quantity).to eq(6)
      expect(@product1.quantity).to eq(3)
    end

    xit 'does not deduct quantity from products that are not in the order' do
    end
  end
end
