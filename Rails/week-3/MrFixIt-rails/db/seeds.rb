# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  user = User.create(
      :email => 'user@epicodus.com',
      :password => 'testtest',
      :password_confirmation => 'testtest')
  worker = User.create(
      :email => 'worker@epicodus.com',
      :password => 'testtest',
      :password_confirmation => 'testtest',
      :worker => true)

Job.create(:title => 'Repair Door', :description => 'Blown off of hinges, major rework')
Job.create(:title => 'Paint Garage', :description => 'Blue #255', :worker_id => worker.id)
Job.create(:title => 'Fix Leaky Gazebo', :description => 'Kids were complaining')