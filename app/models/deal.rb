class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :deal_categories, dependent: :destroy
  has_many :categories, through: :deal_categories

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
