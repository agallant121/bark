require 'rails_helper'

RSpec.describe 'As a visitor' do
  before(:each) do
    @user = User.create(email: 'alex@gmail.com', password: 'balloon')
    @place1 = @user.restaurants.create(name: 'Best Pizza Around')
    @place2 = @user.restaurants.create(name: 'Balloon Ice Cream')
    @place1_review = @place1.reviews.create(rating: 5, comment: 'Good', user_id: 1)
    @place2_review = @place2.reviews.create(rating: 5, comment: 'Good', user_id: 1)
  end

  it "has a home page" do
    visit root_path

    expect(page).to have_content('Welcome')
  end

  it "shows restaurants" do

    visit root_path

    within "#eats" do
      expect(page).to have_text('Best Pizza Around')
      expect(page).to have_text('Balloon Ice Cream')

      expect(Review.all.count).to eq(2)
      expect(@place1.reviews.count).to eq(1)
      expect(@place2.reviews.count).to eq(1)
    end
  end
end
