require 'bundler'

#Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry



puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "le nom du joueur"
print ">"
human_name =  gets.chomp

user = HumanPlayer.new(human_name)
player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

while (player1.life_points > 0 || player2.life_points > 0 ) && user.life_points > 0# cette boucle sert pour délimiter le combat
	puts "*************Voici l'état de chaque joueur:***********"
	puts user.show_state

	puts "=======> Quelle action veux-tu effectuer<============= ?"
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner "
	

	puts "un joueur en vue :"
	if player1.life_points > 0
		puts "0 - #{player1.show_state}"
	else
		puts "#{player1.name} est mort(e)"
	end
	if player2.life_points > 0
		puts "1 - #{player2.show_state}"
	else
		puts "#{player2.name} est mort(e)"
	end
	print ">"
	action = gets.chomp #l'utilisateur choisit son action
	#les actions possibles
	if action == "a"
		user.search_weapon
	end

	if action == "s"
		user.search_health_pack
	end

	if action == "0"
		user.attacks(player1)
	 end

	
	 if action == "1"
	 	user.attacks(player2)
	 end
	 puts "==========>Les autres joueurs t'attaquent !<=========== "
	 enemies.each do|bot|
	 	if user.life_points <= 0 
  			break
  		end
  		if bot.life_points > 0
  		bot.attacks(user)
  		end
	 end 	
end

if user.life_points > 0
	puts "/////BRAVO ! TU AS GAGNE !//////" 
else
	puts "Loser ! Tu as perdu !"
end
