require 'rails_helper'

feature 'endorsing reviews' do

  before do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, thoughts: 'finger lickin')
  end

  scenario 'a review has a link to endorse a review' do
    visit '/restaurants'
    expect(page).to have_link('Endorse this KFC review')
  end

  scenario 'a review displays an endorsement associated with it', js: true do
    visit '/restaurants'
    click_link 'Endorse this KFC review'
    expect(page).to have_content('1 endorsement')
  end

  scenario 'a review displays multiple endorsements associated with it', js: true do
    visit '/restaurants'
    click_link 'Endorse this KFC review'
    click_link 'Endorse this KFC review'
    expect(page).to have_content('2 endorsements')
  end

end
