require 'rails_helper'

describe ReviewsHelper, type: :helper do
  context "#star_rating" do

    it "does nothing for not a number" do
      expect(helper.star_rating('N/A')).to eq "N/A"
    end

    it "returns six black stars for six" do
      expect(helper.star_rating(6)).to eq "★★★★★★"
    end

    it "returns three black star and three white stars for three" do
      expect(helper.star_rating(3)).to eq "★★★☆☆☆"
    end

  end
end
