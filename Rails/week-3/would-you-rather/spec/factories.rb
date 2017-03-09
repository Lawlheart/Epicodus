FactoryGirl.define do
  factory(:choice) do
    title 'Would you rather go back to'
    description ''
    option_a 'Ancient Greece'
    option_b 'Ancient Rome'
  end
  factory(:vote) do
    selection 'option_a'
  end
  factory(:comment) do
    content 'FIRST!!!!'
  end
end
