require 'rails_helper'

feature 'endorsing reviews' do

  before do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, thoughts: 'finger lickin')
  end

  scenario 'a user can endorse a review, which updates the endorsement count' do
    visit '/restaurants'
    click_link 'Endorse this KFC review'
  end

end
