class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true
end