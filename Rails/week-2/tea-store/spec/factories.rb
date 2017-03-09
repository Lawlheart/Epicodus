FactoryGirl.define do
  factory(:tea) do
    name 'English Breakfast'
    description 'English Breakfast is a full-bodied black tea blend that goes well with a traditional English breakfast.'
    price 3.00
  end
  factory(:user) do
    email 'guest@example.com'
    password 'guest'
  end
  factory(:admin, :class => User) do
    email 'admin@example.com'
    password 'admin'
    admin true
  end
end