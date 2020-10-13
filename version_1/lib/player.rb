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