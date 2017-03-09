require 'rails_helper'

describe Job do
  it { should validate_presence_of :title }
end