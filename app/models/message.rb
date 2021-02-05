class Message < ApplicationRecord
  # has_one_attached :image
  has_many_attached :images
  validates :content, presence: true
end
