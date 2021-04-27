require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def beginning_of_game
	puts "------------------------------------------------------------"
	puts "|       Bienvenue sur 'ILS VEULENT TOUS MA POO !            "
	puts "|     Le but du jeu est d'être le dernier survivant !       "
	puts "------------------------------------------------------------"
end

def get_user_name
	puts "Quel sera ton nom pour cette partie ?"
	print "> "
	name = gets.chomp
	return name
end

def game
  beginning_of_game
	user_name = get_user_name
	user = HumanPlayer.new(user_name)
	my_game = Game.new(user_name)

  while my_game.is_still_ongoing?
    puts "----------------------------------------------"
    my_game.show_players
    gets.chomp
    my_game.menu
    my_game.menu_choice(gets.chomp)
    gets.chomp
		my_game.enemies_attacks
		gets.chomp
  end

  my_game.end_of_game
end


#---------- LANCEMENT DU JEU ---------------
game

binding.pry