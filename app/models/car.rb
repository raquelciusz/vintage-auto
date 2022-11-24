class Car < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :sales, dependent: :destroy
  has_many_attached :photo_url

  pg_search_scope :search,
  against: [
    :brand, :model,
    :year, :color,
    :location, :description
  ],
  using: {
    tsearch: { prefix: true }
  }
end
