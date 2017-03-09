class Comment < ApplicationRecord
  validates :author, :presence => true
  validates :content, :presence => true
  belongs_to :choice
end
