class Anime < ApplicationRecord
  validates :title, presence: true
  has_one_attached :photo
  validates :title, uniqueness: true
end
