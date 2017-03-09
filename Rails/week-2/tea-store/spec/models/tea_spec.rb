require 'rails_helper'

describe Tea, type: :model do
  it { should have_many :reviews }

  it { should validate_presence_of :name}
  it { should validate_presence_of :description}
  it { should validate_presence_of :price}
end
