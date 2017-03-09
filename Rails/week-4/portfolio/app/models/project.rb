class Project < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :skills
end