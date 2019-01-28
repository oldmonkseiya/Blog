class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :body, presence: true
end
