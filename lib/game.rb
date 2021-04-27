class Game
  attr_accessor :human_player, :enemies

  	# Initialisation de la partie avec le jouer humain et 3 joueurs robot
    def initialize(name)
      @human_player = HumanPlayer.new(name)
      @enemies = []
      for i in 1..3
        robot_name = "player#{i}"
        enemies << Player.new(robot_name)
      end
    end

    def kill_player(player)
      @enemies.delete(player)
    end

    def is_still_ongoing?
      if @human_player.life_points > 0 && @enemies.length > 0
        return true
      else return false
      end
    end

    def show_players
      @human_player.show_state
      @enemies.each do |x|
        x.show_state
      end
    end

    def menu
      puts "Quelle action veux-tu effectuer ?"
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner"
      puts "attaquer un joueur en vue :"

      @enemies.each do |x|
        print "#{@enemies.index(x)} - "
        x.show_state
      end
      
    end

    def menu_choice(choice)
      if choice == "a"
        @human_player.search_weapon
      end
      if choice == "s"
        @human_player.search_health_pack
       end
       if choice == "0" || choice == "1" || choice == "2"
         @enemies.each do |x|
           if choice.to_i == @enemies.index(x)
             @human_player.attacks(x)
             if x.life_points <= 0
               kill_player(x)
             end
           end
         end
       end
    end

    def enemies_attacks
      enemies.each do |x|
        if x.life_points > 0
          x.attacks(@human_player)
        end
      end
    end
    
    def end_of_game
      puts "La partie est finie"

      if (@human_player.life_points > 0)
        puts "Bravo ! Tu as gagné !"
      else
        puts "Loser ! Tu as perdu !"
      end
    end

end