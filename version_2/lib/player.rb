class Player
	attr_accessor :name, :life_points
	def initialize (name_to_save)
		@name = name_to_save
		@life_points = 10
	end

	def show_state# methode pour montrer les points de vie
		return "#{@name} à #{@life_points} point de vie"	
	end

	def gets_damage(damage)#methode pour compter les points de vie

		@life_points = @life_points - damage

		if @life_points <= 0
			puts "le joueur #{@name} a été tué"
		end
	end

	def attacks (player_defense)#methode pour attaquer
		puts "le joueur #{@name} attaque #{player_defense.name}"
		attacks_point = compute_damage
		puts "il lui a infligé #{attacks_point} point de dommages"
		player_defense.gets_damage(attacks_point)
	end

	def compute_damage #point d'attaque
		return rand(1..6)
	end
end

class HumanPlayer < Player#classe pour les joueurs humains
	attr_accessor :weapon_level

	def initialize(name_to_save)
		@name = name_to_save
		@weapon_level = 1
		@life_points = 100
	end

	def show_state
		return "#{@name} à #{@life_points} point de vie et une arme de niveau #{@weapon_level}"	
	end

	def compute_damage #point d'attaque
		return rand(1..6) * @weapon_level
	end

	def search_weapon#methode pour changer d'arme
		@dice = rand(1..6)

		puts "Tu as trouvé une nouvelle arme de niveau #{@dice}"

		if @dice > @weapon_level
			@weapon_level = @dice
			puts " Youhou! elle est meilleur que ton arme actuelle : tu la prends!"
		else
			puts "... Elle est éclaté au sol frère !"
		end

	end

	def search_health_pack#methode pour gagner de PV
		@dice_health = rand(1..6)

		if @dice_health = 1
			puts "Tu n'as rien trouvé"
		end

		if @dice >= 2 && @dice <= 5 && @life_points < 100
		 	if @life_points <= 50
		 		@life_points = @life_points +50
		 	end
			if @life_points > 50
		 		@life_points = @life_points + (100 -@life_points)
		 	end
			puts "Bravo ! tu as trouvé un pack de +50 points de vie"
		end

		if @dice_health = 6
			if @life_points <= 20
		 		@life_points = @life_points +50
		 	end
			if @life_points > 20
		 		@life_points = @life_points + (100 -@life_points)
			end
			puts "Waoooow, tu as trouvé un pack de +80 points de vie"
		end
	end
end