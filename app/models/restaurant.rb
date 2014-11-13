class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: ":style/missing.png"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def average_rating
    return "N/A" if reviews.none?
    reviews.average(:rating)
  end

end
