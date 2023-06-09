require 'rails_helper'

RSpec.describe DealCategory, type: :model do
  describe 'Category model' do
    before(:each) do
      @user = User.create!(name: 'Anonymus', email: 'anonymus@anon.co', password: 'password')
      @category = Category.create!(name: 'McGyver', icon: 'shorturl.at/nxQZ7', user: @user)
      @deal = Deal.create!(name: 'Pork ribs', amount: 13, author: @user)
    end

    it 'creates a linking table' do
      deal_category = DealCategory.create!(deal_id: @deal.id, category_id: @category.id)
      expect(deal_category).to be_valid
    end
  end
end
