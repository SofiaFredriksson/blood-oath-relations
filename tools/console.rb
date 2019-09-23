require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# follower: name, age, life_motto
# cult: name, location, founding_year, slogan
# bloodoath: cult, follower

f1 = Follower.new("Fia", 25, "Take over the world")
f2 = Follower.new("Gabe", 25, "Help Fia take over the  world")
f3 = Follower.new("Erika", 27, "I already took over the world so...")

c1 = Cult.new("Oh  WOW", "London", 2005, "Win")
c2 = Cult.new("Yay", "Stockholm", 2012, "Have fun, always")
c3 = Cult.new("Sad", "London", 2005, "Sadness")

Bloodoath.new(c1, f1)
Bloodoath.new(c2, f3)
Bloodoath.new(c3, f2)
Bloodoath.new(c2, f2)
Bloodoath.new(c2, f2)
Bloodoath.new(c2, f2)

c1.recruit_follower(f1)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
