class Survey < ActiveRecord::Base
  has_many(:questions)
  has_many(:answers)
  validates(:name, {:presence => true})
  before_save(:capitalize_name)

private

  define_method(:capitalize_name) do
    self.name = name.split.map(&:capitalize).join(" ")
  end
end
