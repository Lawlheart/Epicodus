user = User.create(email: 'krieger@example.com', password: 'guest')

javascript = Skill.create(title: 'JavaScript', category: 'JavaScript')
reactjs = Skill.create(title: 'ReactJS', category: 'JavaScript')
gulp = Skill.create(title: 'Gulp', category: 'JavaScript')
html = Skill.create(title: 'HTML5', category: 'Development')
sass = Skill.create(title: 'Sass', category: 'Design')

game = Project.create(
  title: 'Dungeon Game',
  description: 'Roguelike dungeon game. Players can explore the dungeon, find gear, fight monsters, gain experience, and level up. Defeat the boss to win. Hosted on CodePen.',
  image: 'http://lawlietblack.com/img/projects/roguelike.png',
  github: 'https://github.com/LawlietBlack/FCC-Ziplines/tree/master/Zipline-15',
  demo: 'http://codepen.io/LawlietBlack/full/JGBazL',
  user_id: user.id
)

game.skills.push(javascript, reactjs, gulp, html, sass)