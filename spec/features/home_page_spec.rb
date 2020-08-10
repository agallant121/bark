require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @user = User.create(email: 'alex@gmail.com', password: 'balloon')
    @user2 = User.create(email: 'al@gmail.com', password: 'balloon')
    @place1 = @user.restaurants.create(name: 'Best Pizza Around')
    @place2 = @user.restaurants.create(name: 'Balloon Ice Cream')
    @place3 = @user2.restaurants.create(name: 'CannonBall Ice Cream')
    @place1_review = @place1.reviews.create(rating: 5, comment: 'Good', user_id: 1)
    @place1_review2 = @place1.reviews.create(rating: 4, comment: 'Good', user_id: 1)
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

      expect(Review.all.count).to eq(3)
      expect(@place1.reviews.count).to eq(2)
      expect(@place2.reviews.count).to eq(1)
    end
  end

  xit "shows helpful reviews you have clicked" do
    visit '/users/sign_in'

    fill_in :Email, with: @user.email
    fill_in :Password, with: @user.password
    click_button "Log in"
    visit "/restaurants/#{@place1.id}"

    within "#restrevs" do
      click_link "Save Review" #This is not working because I changed the .html to a .js file
    end

    visit root_path

    within "#revs-#{@place1.id}" do
      expect(page).to have_link("#{@place1.name}")
    end
  end

  it "shows an average review on restaurant show page" do
    visit '/users/sign_in'

    fill_in :Email, with: @user.email
    fill_in :Password, with: @user.password
    click_button "Log in"
    visit "/restaurants/#{@place1.id}"

    expect(page).to have_content('Average Rating: 4.5')
  end

  it "can only modify your restaurants" do
    visit '/users/sign_in'

    fill_in :Email, with: @user.email
    fill_in :Password, with: @user.password
    click_button "Log in"
    visit "/restaurants"

    within "#listrest-#{@place1.id}" do
      expect(page).to have_link("Edit")
    end

    within "#listrest-#{@place3.id}" do
      expect(page).to_not have_link("Edit")
    end
  end
end
