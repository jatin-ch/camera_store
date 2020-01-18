class Cart < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :user

  accepts_nested_attributes_for :products

  validates :user_id, presence: true, uniqueness: true
end
