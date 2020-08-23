class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  # has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
