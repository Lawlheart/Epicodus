require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :user }
  it { should belong_to :tea }
  it { should validate_presence_of :title}
end
