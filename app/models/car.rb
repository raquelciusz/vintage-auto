class Car < ApplicationRecord
  belongs_to :user
  has_many :sales, dependent: :destroy

  has_many_attached :photos
end
