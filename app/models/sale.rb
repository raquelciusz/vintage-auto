class Sale < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :user_id, :car_id, presence: true
end


