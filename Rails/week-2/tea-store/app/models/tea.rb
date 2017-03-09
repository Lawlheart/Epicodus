class Tea < ApplicationRecord
  has_many :reviews

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end