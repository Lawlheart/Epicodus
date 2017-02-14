class Product < ApplicationRecord
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :origin, :presence => true
end
