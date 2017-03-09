Tea.create(
    name: 'English Breakfast',
    description: 'English Breakfast is a full-bodied black tea blend that goes well with a traditional English breakfast.',
    price: 3.00,
    tea_type: 'Black Tea',
    caffeine: '60mg',
    flavor: 'Full-bodied infusion with malty and oaky undertones.',
    instructions: 'Brew at 205 degrees for 5 minutes'

)
Tea.create(
    name: 'Masala Chai',
    description: 'Masala Chai tea blend combines premium Ceylon black tea with cinnamon, cardamom, cloves and ginger.',
    price: 4.00,
    tea_type: 'Chai Tea',
    caffeine: '50mg',
    flavor: 'Robust infusion of rich spice notes from cinnamon, ginger, cloves',
    instructions: 'Brew at 205 degrees for 7 minutes'
)
User.create(email: 'admin@example.com', password: 'admin', admin: true)
User.create(email: 'guest@example.com', password: 'guest', admin: false)

Review.create(title: 'Good Stuff', content: '', stars: 5)