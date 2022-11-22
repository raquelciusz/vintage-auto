class Car < ApplicationRecord
  belongs_to :user
  has_many :sales

  has_many_attached :photo_url
end
