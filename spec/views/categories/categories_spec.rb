require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'GET categories#index' do
    before(:each) do
      user = User.create name: 'anonymus', email: 'anonymus@anon.co', password: 'password'

      visit new_user_session_path
      page.fill_in placeholder: 'Email', with: user.email
      page.fill_in placeholder: 'password', with: user.password
      click_button 'Next'
      3.times do
        @category = Category.create! name: 'McGyver', icon: 'shorturl.at/nxQZ7', user:
      end
    end

    it 'should display the category names that have been added' do
      visit root_path
      expect(page).to have_content(@category.name).thrice
    end

    it "should render page contenting 'Food'" do
      visit root_path
      expect(page).to have_content('CATEGORIES')
    end
  end
end
