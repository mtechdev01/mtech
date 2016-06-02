# Création de valeurs par default pour developpement

puts "CREATION DES UTILISATEURS"
admin = User.new(
  :email                 => "admin@local.io",
  :unconfirmed_email     => "admin@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  confirmed_at: DateTime.now,
  username: "Admin",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: true,
  is_banned: false,
  can_comment: true,
  territory_attachment: "Domicile",
  last_name: "Dus",
  first_name: "Jean-Claude",
  country: "France",
)
admin.save!

jc = User.new(
  :email                 => "jc@local.io",
  :unconfirmed_email     => "jc@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  confirmed_at: DateTime.now,
  username: "jean-christophe",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
  territory_attachment: "Domicile",
  last_name: "Dus",
  first_name: "Jean-Claude",
  country: "France",
)
jc.save!

cecile = User.new(
  :email                 => "cecile@local.io",
  :unconfirmed_email     => "cecile@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  confirmed_at: DateTime.now,
  username: "cecile",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
  territory_attachment: "Domicile",
  last_name: "Dus",
  first_name: "Jean-Claude",
  country: "France",
)
cecile.save!

john = User.new(
  :email                 => "john@local.io",
  :unconfirmed_email     => "john@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  confirmed_at: DateTime.now,
  username: "john",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
  territory_attachment: "Domicile",
  last_name: "Dus",
  first_name: "Jean-Claude",
  country: "France",
)
john.save!

jerome = User.new(
  :email                 => "jerome@local.io",
  :unconfirmed_email     => "jerome@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  confirmed_at: DateTime.now,
  username: "jerome",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
  territory_attachment: "Domicile",
  last_name: "Dus",
  first_name: "Jean-Claude",
  country: "France",
)
jerome.save!

benjamin = User.new(
  :email                 => "benjamin@local.io",
  :unconfirmed_email     => "benjamin@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  confirmed_at: DateTime.now,
  username: "benjamin",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
  territory_attachment: "Domicile",
  last_name: "Dus",
  first_name: "Jean-Claude",
  country: "France",
)
benjamin.save!

puts "CREATION DES CATEGORIES"
cat1 = Category.new(
  name: "Agriculture",
  icon: "https://image.freepik.com/icones-gratuites/tracteur_318-102062.png",
  color: "#FACC2E"
)
cat1.save!

cat2 = Category.new(
  name: "Développement durable",
  icon: "https://image.freepik.com/icones-gratuites/planter-un-arbre_318-41630.png",
  color: "#0EA723"
)
cat2.save!

cat3 = Category.new(
  name: "Economie",
  icon: "https://image.freepik.com/icones-gratuites/tirelire_318-37219.png",
  color: "#0AA0EB"
)
cat3.save!

cat4 = Category.new(
  name: "Emploi/Formation",
  icon: "https://image.freepik.com/icones-gratuites/homme-en-bureau-avec-ordinateur_318-29805.png",
  color: "#FE0404"
)
cat4.save!

cat5 = Category.new(
  name: "Habitat",
  icon: "https://image.freepik.com/icones-gratuites/la-maison-avant_318-49828.png",
  color: "#68A49E"
)
cat5.save!

cat6 = Category.new(
  name: "Service à la personne",
  icon: "https://image.freepik.com/icones-gratuites/aider-les-personnes-agees_318-80096.png",
  color: "#F43095"
)
cat6.save!

cat7 = Category.new(
  name: "Tourisme/Culture",
  icon: "https://image.freepik.com/icones-gratuites/comiques-et-dramatiques-masques_318-61635.png",
  color: "#FF6200"
)
cat7.save!

cat8 = Category.new(
  name: "Numérique",
  icon: "https://image.freepik.com/icones-gratuites/reseau-informatique-sur-la-bande_318-39449.png",
  color: "#0400FF"
)
cat8.save!

cat9 = Category.new(
  name: "Santé",
  icon: "https://image.freepik.com/icones-gratuites/battements-cardiaques_318-71082.png",
  color: "#FA58F4"
)
cat9.save!

cat10 = Category.new(
  name: "Autre",
  icon: "https://image.freepik.com/icones-gratuites/chef-d&-39;un-groupe-avec-une-bulle-vide_318-44062.png",
  color: "#8904B1"
)
cat10.save!

puts "CREATION DES ARTICLES"
article1 = Article.new(
  owner: admin,
  category: cat1,
  name: "Article numero 1",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  published: true,
  published_at: "2016-06-11 11:40:07.431666",
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article1.save!

article2 = Article.new(
  owner: admin,
  category: cat1,
  name: "Article numero 2",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  published: true,
  published_at: "2016-06-11 11:40:07.431666",
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article2.save!

article3 = Article.new(
  owner: admin,
  category: cat1,
  name: "Article numero 3",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  published: true,
  published_at: "2016-06-11 11:40:07.431666",
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article3.save!

article4 = Article.new(
  owner: admin,
  category: cat2,
  name: "Article numero 4",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  published: false,
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article4.save!

article5 = Article.new(
  owner: admin,
  category: cat3,
  name: "Article numero 5",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  published: false,
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article5.save!

article6 = Article.new(
  owner: admin,
  category: cat4,
  name: "Article numero 6",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  published: false,
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article6.save!

puts "CREATION DES PROJETS"
projet1 = Project.new(
  owner: jc,
  category: cat1,
  name: "Projet numero 1 de jc",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  published: true,
  location: "Belleville",
  thumb: "https://i.ytimg.com/vi/ljm6RU6lRuM/maxresdefault.jpg"
)
projet1.save!

projet2 = Project.new(
  owner: cecile,
  category: cat2,
  name: "Projet numero 2 de cecile",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  published: true,
  location: "Charny",
  thumb: "https://i.ytimg.com/vi/ljm6RU6lRuM/maxresdefault.jpg"
)
projet2.save!

projet3 = Project.new(
  owner: john,
  category: cat3,
  name: "Projet numero 3 de john",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  location: "verdun",
  thumb: "https://i.ytimg.com/vi/ljm6RU6lRuM/maxresdefault.jpg",
)
projet3.save!

projet4 = Project.new(
  owner: jerome,
  category: cat4,
  name: "Projet numero 4 de jerome",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  location: "bras-sur-meuse",
  thumb: "https://i.ytimg.com/vi/ljm6RU6lRuM/maxresdefault.jpg"
)
projet4.save!

projet5 = Project.new(
  owner: benjamin,
  category: cat5,
  name: "Projet numero 5 de benjamin",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  location: "verdun",
  thumb: "https://i.ytimg.com/vi/ljm6RU6lRuM/maxresdefault.jpg"
)
projet5.save!

puts "CREATION DES SONDAGES"
survey1 = Survey.new(
  title: "Sondage 1",
  description: "Voici mon premier sondage",
  start_at: "2016-04-09 11:40:07.431666",
  end_at: "2016-05-07 11:40:07.431666"
)
survey1.save!

poll2 = Survey.new(
  title: "Sondage numero 2",
  description: "Voici mon deuxieme sondage",
  start_at: "2016-04-10 11:40:07.431666",
  end_at: "2016-04-30 11:40:07.431666"
)
poll2.save!

puts "CREATION DES QUESTIONS DES SONDAGES"
fields1 = SurveysField.new(
  survey: survey1,
  input_type: "text",
  is_required: true,
  options: nil,
  rules: nil,
  question: "Quelle est la marque de votre téléviseur ?"
)
fields1.save!

fields2 = SurveysField.new(
  survey: survey1,
  input_type: "number",
  is_required: true,
  options: nil,
  rules: "min=0, max=24",
  question: "Combien d'heure(s) regardez vous la télévision par jour ?"
)
fields2.save!

fields3 = SurveysField.new(
  survey: survey1,
  input_type: "select",
  is_required: true,
  options: "tf1, france2, France3, M6",
  rules: nil,
  question: "Quelle chaîne regardez vous le plus ?"
)
fields3.save!

