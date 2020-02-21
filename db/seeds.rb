user = User.create_with(password: 'qwe123').find_or_create_by!(email: 'test@test.pl')

tasks = [
  { title: "tidy room", priority: 3 },
  { title: "do shopping", priority: 8 },
  { title: "make a project", priority: 7 },
  { title: "take a rest", priority: 9 },
  { title: "fix a bug", priority: 1 },
  { title: "call grandma", priority: 8 },
  { title: "hangout with friends", priority: 8 },
  { title: "watch a movie", priority: 3 },
  { title: "play video game", priority: 4 },
  { title: "go to cinema", priority: 5 },
  { title: "go to gym", priority: 6 },
  { title: "learn to cook", priority: 1 },
  { title: "go on a walk", priority: 6 },
  { title: "fly into space", priority: 9 },
  { title: "create homepage", priority: 3 },
  { title: "sell a tennis racket", priority: 1 },
  { title: "play a guitar", priority: 3 },
  { title: "go jogging", priority: 8 },
  { title: "new haircut", priority: 7 },
  { title: "go to school", priority: 9 },
  { title: "trip around the world", priority: 1 },
  { title: "eat chocolate", priority: 8 },
  { title: "learn new thing", priority: 8 },
  { title: "pay a bill", priority: 3 },
  { title: "do creazy things", priority: 4 },
  { title: "assemble 3d printer", priority: 5 },
  { title: "draw a picture", priority: 6 },
  { title: "meet old friend", priority: 1 },
]

tasks.each do |task_attributes|
  user.tasks.find_or_create_by!(task_attributes)
end
