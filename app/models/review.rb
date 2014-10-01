class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :rating, inclusion: {in: 1..6}
  has_many :endorsements
end
