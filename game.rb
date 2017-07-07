# good tips https//learnrubythehardway.org/book/ex36.html

# the following is modified from a script I wrote a year prior to this for python
# did not want to re-invent game, just changed it to ruby & made use of module

require './game_rooms'

Trophy = [] # apparently this had to start with a capital letter...(constant)

def enemy()
  puts "\nA figure appears in the doorway. A thief!"
  puts "The attacker launches at you."

  health = 3

  while true
    if health > 0
      enemy_interaction()
      health = enemy_health(health)
    else
      Trophy << "silver"
      puts "\nYou collect the silver trophy the thief dropped."
      print "Your collection is now: "
      Trophy.each {|i| print "#{i} "}
      puts "\nYou head back to the main hallway."
      Game_rooms.start()
    end
  end
end

def enemy_interaction()
  puts "Do you duck or swing your bat?"

  print "> "
  choice = $stdin.gets.chomp

  if choice == "duck"
    puts "\nWhat made you think that was gonna work?"
    dead()
  elsif choice.include?("bat") || choice.include?("swing")
    puts "\nYou swing your bat at the enemy."
  else
    enemy_interaction()
  end
end

def enemy_health(health)
  puts "Enemy health point was #{health}."
  puts "You hit the enemy."

  health -= 1

  puts "Enemy hp is now #{health}."

  return health
end

def dead()
  puts "You chose poorly. You died and failed to find all of the trophies. Boo!"
  exit(0)
end

Game_rooms.start()
