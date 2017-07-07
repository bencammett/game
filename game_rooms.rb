module Game_rooms

  def Game_rooms.start()

    if Trophy.sort == ["copper", "gold", "silver"]
      puts "Oh, you have collected all of the trophies. Well done. You win!"
      exit(0)
    end

    puts "You are in a house, with one long hallway, who it belongs to, you do not know."
    puts "There are three doors. Which do you enter first one, two, or three?"

    print "> "
    choice = $stdin.gets.chomp

      if choice == "one"
        puts "\nYou walk to the first room and try the handle."
        puts "The door opens and you find yourself in a kitchen."
        Game_rooms.kitchen()
      elsif choice == "two"
        puts "\nYou walk to the second room and try the handle."
        Game_rooms.bat()
      elsif choice == "three"
        puts "\nYou walk to the third room and try the handle."
        Game_rooms.trap_room()
      else
        Game_rooms.start()
      end
  end

  def Game_rooms.kitchen()
    puts "There's not much in here. Looks like no one has been here in awhile."
    puts "There's an unplugged fridge, a sink, and a table."
    puts "You note that there's a lock on the fridge."
    puts "Do you try to open the fridge, turn on the sink, or inspect the table?"

    key = false

    while true

      print "> "
      choice = $stdin.gets.chomp

      if key && (choice.include?("open") || choice.include?("fridge"))
        puts "\nYou use the key on the lock. The door opens!"
        puts "Inside, you find the copper trophy and add it to your collection."
        Trophy << 'copper'
        print "Your collection is now: "
        Trophy.each {|i| print "#{i} "}
        puts "\nYou head back to the main hallway."
        Game_rooms.start()
      elsif key || (choice.include?("open") || choice.include?("fridge"))
        puts "\nThe lock is secure. The door won't budge."
      elsif choice.include?("turn") || choice.include?("sink")
        puts "\nNothing happens. No running water."
      elsif choice.include?("inspect") || choice.include?("table")
        puts "\nYou inspect the table and find a key taped to the underside."
        puts "You take the key."
        key = true
      else
        puts "\nWell that's not at all what Parzival would do. Try again."
      end
    end
  end

  def Game_rooms.trap_room()
    puts "You're in a completely empty room, save for a single table and two chairs."
    puts "Suddenly, the door locks shut behind you."
    puts "A ghostly figure appears and motions for you to sit. So you do."
    puts """GHOST: \"I have a riddle for you.
        Should you answer right, I\'ll grant you to leave with a reward.
        Should you answer wrong, I\'ll deliver your death swiftly.\""""
    puts """GHOST: \"Two bodies have I, yet both joined in one.
        The stiller I stand, the faster I run.
        What am I?\""""

    print "> "
    choice = $stdin.gets.chomp

    if choice.include?("hourglass")
      puts "\nGHOST: \"Hmmm, that is correct...congratulations.\""
      puts "The figure fades away. In its place, a gold trophy."
      puts "You take the gold tropy and add it to your collection."
      Trophy << 'gold'
      print "Your collection is now: "
      Trophy.each {|i| print "#{i} "}
      puts "\nYou head back to the main hallway."
      Game_rooms.start()
    else
      puts "\nGHOST \"Pitty, time waits for no one.\""
      dead()
    end
  end

  def Game_rooms.bat()
    puts "You enter a room, with a locked door leading somewhere else."
    puts "You also find a bat. Do you pick it up? y/n?"

    print "> "
    choice = $stdin.gets.chomp

    if choice == "y"
      puts "\nYou pick up the bat and then hear the door unlock."
      bat_unlock_room()
    elsif choice == "n"
      puts "\nI don't advise that. Try again you fool."
      Game_rooms.bat()
    else
      Game_rooms.bat()
    end
  end

  def Game_rooms.bat_unlock_room()
    puts "Try to open the door? y/n? - Or hit it with your bat?"

    print "> "
    choice = $stdin.gets.chomp

    if choice == "y"
      puts "\nThe door still won't budge."
      Game_rooms.bat_unlock_room()
    elsif choice == "n"
      puts "\nYou're not curious at all?"
      Game_rooms.bat_unlock_room()
    elsif choice.include?("hit") || choice.include?("bat")
      Game_rooms.new_room()
    else
      Game_rooms.bat_unlock_room()
    end
  end

  def Game_rooms.new_room()
    puts "\nYou smash the door in and enter the new room."
    puts "You hear something in the other room."
    puts "Turn around? y/n?"

    print "> "
    choice = $stdin.gets.chomp

    if choice == "y"
      enemy()
    elsif choice == "n"
      puts "\nSomething hits you and knocks you out."
      puts "It was probably a looter or thief."
      dead()
    else
      puts "\nYou're too slow and that's not an option."
      dead()
    end
  end
end
