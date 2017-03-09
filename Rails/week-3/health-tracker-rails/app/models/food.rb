class Food < ApplicationRecord
  belongs_to :user

  validates :name, :presence => true
  validates :calories, :presence => true
  validates :protein, :presence => true
  validates :carbs, :presence => true
  validates :fat, :presence => true

  def self.food_history(user)
    @foods = Food.where(user_id: user.id)
    dates = @foods.map(&:date).sort { |x,y| y <=> x }
    dates.uniq.map {|date| @foods.where(date: date) }
  end
end
