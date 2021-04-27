###Programmation d'un combat entre deux joueurs

####Class Player La classe Player est constituée des variables de classes suivantes :

@name : nom du joueur
@life_points : points de vie du joueur Elle est constituée des méthodes suivantes
initialize(name) : initialisation d'un joueur
show_state : affichage de l'état du joueur
gets_damage(damage_received) : réévaluation du nombre @life_points en fonction du dommage infligé
compute_damage : retourne un nombre entre 1 et 6 correspond à un dommage aléatoire infligé
attacks(player) : action d'attaque d'un joueur sur un autre
La classe HumanPlayer est héritée de la classe Player. Elle est constituée des variables supplémentaires suivantes :

@weapon_level Les méthodes supplémentaires sont les suivantes :
search_weapon : un chiffre au hasard entre 1 et 6 détermine si le joueur peut acquérir une arme de niveau supérieur
search_health_pack : un chiffre au hasard entre 1 et 6 détermine si le joueur peut acquérie des points de vie supplémentaires.


####Class Game : La classe Game est constituée des variables de classes suivantes :

@human_player : le joueur humain ainsi que ses caractéristiques.
@enemies :  un array contenant tous les ennemis.

initialize(name) : demande d'initialisation d'un joueur et initialisation des 3 ordinateurs.
kill_player(player) : permet d'enlever un ordinateur de la partie lors de sa mort.
is_still_ongoing? : Vérifie si la partie est finie ou non.
show_players : affiche l'état de tous les joueurs.
menu : affiche le menu de choix du joueur.
menu_choice(choice) : interprete le choix du joueur.
enemies_attacks : fait attaquer chaque ennemi à tour de rôle.
end_of_game : affiche une phrase de fin de partie au joueur.

La partie de jeu se déroule :

Dans app.rb : deux joueurs robots s'affrontent
Dans app_2.rb : un joueur humain et deux joueurs robots s'affrontent.
Dans app_3.rb : un joueur humain et trois joueurs robots s'affrontent.
