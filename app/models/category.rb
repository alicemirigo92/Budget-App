class Category < ApplicationRecord
  belongs_to :user

  # has_one_attached :icon
  has_many :deal_categories, dependent: :destroy
  has_many :deals, through: :deal_categories

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
