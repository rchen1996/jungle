require 'rails_helper'

RSpec.describe Product, type: :model do
  before { @category = Category.create(name: 'Household') }

  it 'should save successfully when given a value for all fields' do
    @product =
      Product.new(
        name: 'Product',
        price: 100,
        quantity: 4,
        category_id: @category[:id],
      ).save
    expect(@product).to eq(true)
  end

  describe 'Validations' do
    it 'should validate name' do
      @product =
        Product.create(
          name: nil,
          price: 100,
          quantity: 4,
          category_id: @category[:id],
        )

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should validate price' do
      @product =
        Product.create(
          name: 'Product',
          price: nil,
          quantity: 4,
          category_id: @category[:id],
        )

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should validate quantity' do
      @product =
        Product.create(
          name: 'Product',
          price: 100,
          quantity: nil,
          category_id: @category[:id],
        )

      expect(@product.errors.full_messages).to include(
        "Quantity can't be blank",
      )
    end

    it 'should validate category' do
      @product =
        Product.create(
          name: 'Product',
          price: 100,
          quantity: 4,
          category_id: nil,
        )

      expect(@product.errors.full_messages).to include(
        "Category can't be blank",
      )
    end
  end
end
