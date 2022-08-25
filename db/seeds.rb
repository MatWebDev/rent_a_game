require 'faker'
require "open-uri"

puts "Cleaning DB..."

Booking.destroy_all
Game.destroy_all
User.destroy_all

puts "Creating users..."

User.create!(
  email: "marilou.pichol@test.fr",
  password: "password",
  first_name: "marilou",
  last_name: "pichol"
)

User.create!(
  email: "mathieu.ferry@test.fr",
  password: "password",
  first_name: "mathieu",
  last_name: "ferry"
)

User.create!(
  email: "guillaume.teillais@test.fr",
  password: "password",
  first_name: "guillaume",
  last_name: "teillais"
)

User.create!(
  email: "jerome.pomonti@test.fr",
  password: "password",
  first_name: "jerome",
  last_name: "pomonti"
)

User.create!(
  email: "passengerslewagon@gmail.com",
  password: "password",
  first_name: "iggy",
  last_name: "pop"
)

puts "Creating games..."

file = URI.open("https://res.cloudinary.com/dxryafvlv/image/upload/v1661174526/Rent%20A%20Game/uno.jpg")
game = Game.new(
  name: "Uno",
  description: "Les joueurs tentent de se débarrasser de leurs cartes en recouvrant la carte retournée en haut de la pile par une carte correspondante de leur main. Des cartes action rythment le jeu, comme la carte Changement de main ou les nouveaux Jokers personnalisables. Si le joueur ne peut pas jouer, il pioche. Le joueur qui se débarrasse en 1er de toutes ses cartes se voit attribuer les points des cartes que ses adversaires ont encore en main. Le vainqueur est le 1er joueur à atteindre 500 points.",
  address: "toulouse",
  price_per_day: rand(1.0..10.00).round(2),
  disponibility: true,
  user_id: User.all.sample.id
)
game.photo.attach(io: file, filename: "uno.jpg", content_type: "image/jpg")
game.save!

file = URI.open("https://res.cloudinary.com/dxryafvlv/image/upload/v1661172907/Rent%20A%20Game/scrabble.jpg")
game = Game.new(
  name: "Scrabble",
  description: "Scrabble est le jeu de plateau classique avec lequel on ne s'ennuie jamais ! Formez des mots entrecroisés sur le plateau de jeu à l'aide de lettres aux valeurs différentes. Le but du jeu est d'obtenir le score le plus élevé grâce à la valeur des lettres et aux points supplémentaires des cases Prime de la grille. Comprend un plateau de jeu Scrabble , 100 lettres, 4 chevalets, un sac à lettres et des règles du jeu. De 2 à 4 joueurs. À partir de 10 ans.",
  address: "marseille",
  price_per_day: rand(1.0..10.00).round(2),
  disponibility: true,
  user_id: User.all.sample.id
)
game.photo.attach(io: file, filename: "scrabble.jpg", content_type: "image/jpg")
game.save!

file = URI.open("https://res.cloudinary.com/dxryafvlv/image/upload/v1661172907/Rent%20A%20Game/monopoly.jpg")
game = Game.new(
  name: "Monopoly",
  description: "Les joueurs choisissent leur pion Monopoly préféré, le placent sur la case Départ et lancent les dés pour tout posséder. Cette édition du jeu de plateau pour la famille inclut 16 cartes Caisse de communauté choisies par les fans. Le jeu est le même, il faut acheter, vendre et échanger des propriétés pour gagner. Les cartes Chance et Caisse de communauté peuvent modifier la partie : un joueur peut s'enrichir ou être envoyé en prison.",
  address: "paris",
  price_per_day: rand(1.0..10.00).round(2),
  disponibility: true,
  user_id: User.all.sample.id
)
game.photo.attach(io: file, filename: "monopoly.jpg", content_type: "image/jpg")
game.save!

file = URI.open("https://res.cloudinary.com/dxryafvlv/image/upload/v1661172906/Rent%20A%20Game/7-wonders.jpg")
game = Game.new(
  name: "7 Wonders",
  description: "Le jeu de plateau avec plus d'un million d'exemplaires vendus revient dans une toute nouvelle édition pour encore plus de plaisir ! Vous voilà dirigeant de l’une des sept plus grandes cités de l’Antiquité. Développez votre cité en multipliant les découvertes scientifiques, les conquêtes militaires, les accords commerciaux et les édifices prestigieux pour mener votre civilisation vers la gloire ! Pendant ce temps, gardez à l’oeil les progrès de vos voisins qui partagent cette même ambition.Votre merveille arrivera-t-elle à transcender les millénaires à venir ? Prenez les bonnes décisions pour mener votre civilisation à la prospérité ! A partir de 10 ans De 3 à 7 joueurs Durée de jeu : 30 min",
  address: "lyon",
  price_per_day: rand(1.0..10.00).round(2),
  disponibility: true,
  user_id: User.all.sample.id
)
game.photo.attach(io: file, filename: "7_wonders.jpg", content_type: "image/jpg")
game.save

file = URI.open("https://res.cloudinary.com/dxryafvlv/image/upload/v1661172906/Rent%20A%20Game/aventuriers-du-rail.jpg")
game = Game.new(
  name: "Les Aventuriers du Rail",
  description: "Reliez toutes les villes des États-Unis indiquées sur vos cartes Destination. 2 octobre 1900 - Phileas Fogg qui vient de gagner son pari de réussir 'Le tour du monde en 80 jours' a réuni quelques amis autour d'une bonne bouteille de cherry dans un club Londonien cosy. Cet équipage d'aventuriers en goguette, de rentiers désabusés et autres aristocrates voyageurs devisent avec passion de leurs défis passés. Au cours de la soirée, les esprits s'échauffent et soudain Phileas propose une nouvelle équipée de l'impossible ! L'enjeu ? 1 million de dollars ! Le défi ? Traverser le plus de villes américaines en moins de 7 jours !",
  address: "lille",
  price_per_day: rand(1.0..10.00).round(2),
  disponibility: true,
  user_id: User.all.sample.id
)
game.photo.attach(io: file, filename: "aventuriers_du_rail.jpg", content_type: "image/jpg")
game.save

puts "It's All Done Man!"
