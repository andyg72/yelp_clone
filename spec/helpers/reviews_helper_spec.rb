require 'rails_helper'

describe ReviewsHelper, type: :helper do

  context 'star rating' do

    it 'does nothing if not a number' do
      expect(helper.star_rating('N/A')).to eq('N/A')
    end

    it 'returns five balck stars for five' do
      expect(helper.star_rating(5)).to eq '★★★★★'
    end

    it 'returns three black stars and two white stars for three' do
      expect(helper.star_rating(3)).to eq '★★★☆☆'
    end

    it 'returns four black stars and one white star for 3.5' do
      expect(helper.star_rating(3.5)).to eq "★★★★☆"
    end

  end

  context 'time stamp' do

    it 'shows minutes since made when less then hour' do
      review = Review.create(thoughts: 'Great',rating: 1)
      Timecop.travel(60*10)
      expect(helper.time_since(review)).to eq "10 minutes ago"
      Timecop.return
    end

    it 'shows minutes since made when more then hour and less then a day' do
      review = Review.create(thoughts: 'Great',rating: 1)
      Timecop.travel(60*60*2)
      expect(helper.time_since(review)).to eq "2 hours ago"
      Timecop.return
    end

    it 'shows more then a day less then a week' do
      review = Review.create(thoughts: 'Great',rating: 1)
      Timecop.travel(60*60*24*3)
      expect(helper.time_since(review)).to eq "3 days ago"
      Timecop.return
    end

    it 'shows more then a week' do
      review = Review.create(thoughts: 'Great',rating: 1)
      Timecop.travel(60*60*24*7*3)
      expect(helper.time_since(review)).to eq review.created_at.strftime("%-d-%-m-%Y")
      Timecop.return
    end

  end

end
