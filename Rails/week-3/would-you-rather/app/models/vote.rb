class Vote < ApplicationRecord
  validates :selection, :presence => true
  belongs_to :choice
end
