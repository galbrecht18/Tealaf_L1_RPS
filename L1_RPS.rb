#Lesson One Rock Paper Scissors App
#Created by George Albrecht
#8-31-2015
#Initial Version
#Need to output exactly what was chosen, the value from the CHOICES hash, not just the input
#In conjunction with above point, want to prevent the gets method from returning the value and instead return the key from the hash (mentioned above)

require 'pry'

CHOICES = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}

puts "***** Welcome to Rock, Paper, Scissors! Can you beat the computer? *****"

#method to compare choices and evaluate a winner
def compare_choices player_choice, computer_choice

  if player_choice == computer_choice 
    puts "Tie! Try again!"
  else

    win = "You win!"

    case [player_choice, computer_choice]
    when ['r','s']
      puts "Rock beats scissors! #{win}"
    when ['p','r']
      puts "Paper beats rock! #{win}"
    when ['s','p']
      puts "Scissors beats paper! #{win}"
    else 
      puts "Computer kicked your behind! "+ CHOICES[computer_choice]+ " beats "+ CHOICES[player_choice]+"!"

    end

  end

end

#start the loop/game
loop do

  #get the player choice. Loop to make sure that the player picks a valid choice
    begin 

      puts "***** Enter (r, p, or s) for rock, paper, or scissors. *****"
      player_choice = gets.chomp.downcase.to_s
      puts "You chose #{CHOICES[player_choice]}"

    end until CHOICES.keys.include?(player_choice)

    #get computer choice
    computer_choice = CHOICES.keys.sample.to_s
    puts "Computer chose #{CHOICES[computer_choice]}"

    #compare the choices
    compare_choices(player_choice, computer_choice)

    puts '***** Want to play again? (y/n)? *****'
    break if gets.chomp.downcase != 'y'

end

puts "Later!"