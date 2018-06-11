puts "Welcome to the Happening"
puts "You are an average person fresh out of school at their first day on the job"
puts "You have taken a job at a small start up and are enterting the office for the first time"
puts "What do you want to do?"
puts "Options: Look around the office (look), Go to the room that says HR department (HR), Go home (Home)"
option = gets.chomp.downcase.strip

while option.empty? do
	puts "What do you want to do?"
	puts "Options: Look around the office (look), Go to the room that says HR department (HR), Go home (Home)"
	option = gets.chomp.downcase.strip
end

case option
when "look around the office" , "look"
    puts "You see an office full of hipsters wearing ironic messages on their T-shirts"
    hipsters = gets.chomp.downcase.strip

    while hipsters.empty? do
    	puts "They ask you \"\Do you Like The Artic Fire?\"\ "
    	hipsters = gets.chomp.downcase.strip
    end

    if hipsters == "yes"
    	puts "YAAAAAASSSSSSS. Welcome Home. You live a long life in employment heaven."
    else
    	puts "Worst. Decision. Ever. You slave away every day at your office regretting the day you accepted the job offer"

    end

when "go to the room that says hr department" , "hr"

    puts "You walk into the room which ends up being a broom closet with a sign saying See Peggy"
    hr = gets.chomp.downcase.strip

    while hr.empty? do
    	puts "Are you Peggy?"
    	hr = gets.chomp.downcase.strip
    end

    if hr != "yes"
    	puts "You look in the mirror that is laying against the wall. You just realized, you really are Peggy. You're brain explodes "
    else
    	puts "Over the weekend you had a concusion. It left you confused and your memory is foggy. You were Peggy the whole time and graduated from USF in 1957. Your brain tricked you. Find Help. Please. Seriously. Get up and go see a Doctor.NOW!"
    end

when "go home" , "home"
    puts "You made the right choice. As you turned around to leave, SEC agents raided the building. You start to go on your way to find a real job at a real company."
    puts "As you are wallking away. An Agent approaches you and ask you your name. You have two options, give him your real name or RUN"
    slacker = gets.chomp.downcase.strip

    while slacker.empty? do
    	puts "Enter a name or run!"
    	slacker = gets.chomp.downcase.strip
    end

    if slacker != "run"
    	puts "#{slacker} you are under arrest. your life has been ruined. Game Over forever."
    else
    	puts "The Agent sees you run off into the sunset and is unable to catch you. You Win the game.... this time"

    end

else
    puts "You're not good at following directions are you?"
    puts "The CEO of Company approaches you tells says \"Quit messin around or your fired. You know what I don't have time for this today, so just pack your things I changed my mind. You're Fired\""
end
