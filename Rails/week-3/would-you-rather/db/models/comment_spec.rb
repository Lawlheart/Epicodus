require 'rails_helper'

describe Comment do
  it { should belong_to :choice }
end
