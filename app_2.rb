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
  # Création des joueurs humains et robots
    user = HumanPlayer.new(get_user_name)
    player1 = Player.new("Alice")
    player2 = Player.new("Bob")
    enemies = [player1, player2]

    while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
      user.show_state
      
      puts "Quelle action veux-tu effectuer ?"
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner"
      puts "attaquer un joueur en vue :"
      
      enemies.each do |x|
        print "#{enemies.find_index(x)} - "
        x.show_state
      end
      
      action = gets.chomp
      case action
      when "a"
        user.search_weapon
      when "s"
        user.search_health_pack
      when "0"
        user.attacks(player1)
      when "1"
        user.attacks(player2)
      end
      
      puts "Les autres joueurs t'attaquent !"

      enemies.each do |x|
        if x.life_points > 0
          x.attacks(user)
        end
      end


    end
  return user
end


def end_of_game(user)
  puts "La partie est finie"

  if (user.life_points > 0)
    puts "Bravo ! Tu as gagné !"
  else
    puts "Loser ! Tu as perdu !"
  end
end
#---------- LANCEMENT DU JEU ---------------
beginning_of_game
user = game
end_of_game(user)

binding.pry