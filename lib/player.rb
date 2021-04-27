class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."    
  end

  def compute_damage
    return rand(1..6)
  end
  
  def attacks(player2)
    puts "le joueur #{self.name} attaque le joueur #{player2.name}"
    damage = compute_damage
    puts "#{self.name} a infligé à #{player2.name} #{damage} points de dégâts"
    player2.gets_damage(damage)
    
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
    if @life_points <= 0 
      puts "le joueur #{@name} a été tué"
    end  
  end
end



class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1 
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}"
    if dice > @weapon_level 
      @weapon_level = dice 
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else  
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end  
  end

  def search_health_pack
    dice = rand(1..6)
    case dice
    when 1
      puts "Tu n'as rien trouvé... "
    when 2..5
      @life_points + 50 > 100 ? @life_points = 100 : @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    when 6
      @life_points + 80 > 100 ? @life_points = 100 : @life_points += 80
      puts "Bravo, tu as trouvé un pack de +80 points de vie !"
    end
  end


end