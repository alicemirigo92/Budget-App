require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model' do
    before(:each) do
      @user = User.create name: 'Anonymus', email: 'anonymus@anon.co', password: 'password'
    end

    it 'accepts a valid name' do
      category = Category.create! name: 'McGyver', icon: 'shorturl.at/nxQZ7', user: @user
      expect(category).to be_valid
    end

    it 'accepts a valid icon url' do
      category = Category.create! name: 'McGyver', icon: 'shorturl.at/nxQZ7', user: @user
      expect(category).to be_valid
    end
  end
end
