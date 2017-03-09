class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tea

  validates :title, presence: true
end