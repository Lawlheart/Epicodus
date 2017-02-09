require 'rails_helper'

describe List do
  it { should validate_presence_of :name }
  it { should have_many :tasks }
end