class Choice < ApplicationRecord
  validates :title, :presence => true
  validates :option_a, :presence => true
  validates :option_b, :presence => true
  has_many :votes
  has_many :comments
end
