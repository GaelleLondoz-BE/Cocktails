class Cocktail < ApplicationRecord
  belongs_to :user
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true

  mount_uploader :photo, PhotoUploader

  def average
    sum = self.reviews.pluck(:rating).sum
    reviews_quantity = self.reviews.count
    if reviews_quantity == 0
      return 0
    else
      return sum / reviews_quantity
    end
  end
end
