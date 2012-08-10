# encoding: UTF-8
# Tout ca pour pouvoir utiliser des accents!!
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)


# Attention.. les accents ne marchent pas pour l"instant.. vais chercher pourquoi plus tard
# Ok trouvé une solution.. il faut mettre encoding UTF-8 en haut du document
puts 'Création des utilisateurs'
user1 = User.create(first_name: "Paul", last_name: "Dupont", email: "Paul@test.com", password: "test", password_confirmation: "test", role: :student)
user2 = User.create(first_name: "Pierre", last_name: "Dupont", email: "Pierre@test.com", password: "test", password_confirmation: "test", role: :student)
user3 = User.create(first_name: "Julie", last_name: "Dupont", email: "Julie@test.com", password: "test", password_confirmation: "test", role: :student)
user4 = User.create(first_name: "Jeanne", last_name: "Dupont", email: "Jeanne@test.com", password: "test", password_confirmation: "test", role: :student)
user5 = User.create(first_name: "Alex", last_name: "Dupont", email: "Alex@test.com", password: "test", password_confirmation: "test", role: :student)
user6 = User.create(first_name: "Sarah", last_name: "Dupont", email: "Sarah@test.com", password: "test", password_confirmation: "test", role: :student)

teacher1 = User.create(first_name: "Mireille", last_name: "Dupont", email: "Mireille@test.com", password: "test", password_confirmation: "test", role: :teacher)
teacher2 = User.create(first_name: "Daniel", last_name: "Dupont", email: "Daniel@test.com", password: "test", password_confirmation: "test", role: :teacher)
teacher3 = User.create(first_name: "Nicolas", last_name: "Dupont", email: "Nicolas@test.com", password: "test", password_confirmation: "test", role: :teacher)

admin1 = User.create(first_name: "Stéphane", last_name: "Dupont", email: "admin@test.com", password: "test", password_confirmation: "test", role: :admin)

puts 'Création des classes'
class1 = Classroom.create(name: "classe 1")
class2 = Classroom.create(name: "classe 2")
class3 = Classroom.create(name: "classe 3")


inscription1 = Inscription.create(student: user1, year: "2012" , classroom: class1)
inscription2 = Inscription.create(student: user2, year: "2012" , classroom: class3)
inscription3 = Inscription.create(student: user3, year: "2012" , classroom: class1)
inscription4 = Inscription.create(student: user4, year: "2012" , classroom: class1)
inscription5 = Inscription.create(student: user5, year: "2012" , classroom: class2)
inscription6 = Inscription.create(student: user6, year: "2012" , classroom: class2)



puts 'Création des compétences'
competence1 = Competence.create(name: "Planification et execution de son travail")
competence2 = Competence.create(name: "Prise de notes à partir d'un support écrit")
competence3 = Competence.create(name: "Prise de notes à partir d'un support oral")
competence4 = Competence.create(name: "Recherche d'information")
competence5 = Competence.create(name: "Résumer et reformuler une information")
competence6 = Competence.create(name: "Réaliser un exposé oral")
competence7 = Competence.create(name: "Construire l'argumentation (écrite ou orale)")
competence8 = Competence.create(name: "Effectuer un travail de groupe")
competence9 = Competence.create(name: "Rédiger une lettre de motivation")
competence10 = Competence.create(name: "Rédiger un Curriculum Vitae")
competence11 = Competence.create(name: "Construire son entretien d'embauche")

puts 'Création des capacités'
capacity1 = Capacity.create(name: "Se procure le materiel nécessaire en temps voulu", competence: competence1)
capacity2 = Capacity.create(name: "Classe ses documents d'apprentissage en utilisant la structure dans le temps requis", competence: competence1)
capacity3 = Capacity.create(name: "Retrouve ses documents d'apprentissage en utilisant la structure dans le temps requis", competence: competence1)
capacity4 = Capacity.create(name: "Utilise les outils de planification mis à disposition: agenda, planning...", competence: competence1)
capacity5 = Capacity.create(name: "Apprend a évaluer le temps nécessaire à chaque tache", competence: competence1)
capacity6 = Capacity.create(name: "Planifie son travail en établissant et respectant des priorites", competence: competence1)

capacity7 = Capacity.create(name: "Lit attentivement pour comprendre", competence: competence2)
capacity8 = Capacity.create(name: "Lit pour choisir en sélectionnant l'information prioritaire", competence: competence2)
capacity9 = Capacity.create(name: "Utilise des méthodes graphique pour mettre en evidence mots et passage importants", competence: competence2)
capacity10 = Capacity.create(name: "Prend des notes sous forme de mots clefs dans un temps donne", competence: competence2)
capacity11 = Capacity.create(name: "Restitue oralement ou par écrit le contenu du support initial", competence: competence2)

capacity12 = Capacity.create(name: "Ecoute attentivement pour comprendre", competence: competence3)
capacity13 = Capacity.create(name: "Ecoute attentivement pour selectionner les informations importantes", competence: competence3)
capacity14 = Capacity.create(name: "S'assure de la comprehension du message oral en questionnant, en reformulant", competence: competence3)
capacity15 = Capacity.create(name: "Prend des notes sous forme de mots clefs dans un temps donne", competence: competence3)
capacity16 = Capacity.create(name: "Restitue oralement ou par ecrit sans interpretation le discours", competence: competence3)

capacity17 = Capacity.create(name: "Définir les objets de la recherche", competence: competence4)
capacity18 = Capacity.create(name: "Définir les informations nécessaires", competence: competence4)
capacity19 = Capacity.create(name: "Trouver sélectionner des ressources", competence: competence4)
capacity20 = Capacity.create(name: "Sélectionner les informations pertinentes", competence: competence4)
capacity21 = Capacity.create(name: "Libeller les réferences bibliographiques selon les formes", competence: competence4)

capacity22 = Capacity.create(name: "Retient les idées principales énoncees", competence: competence5)
capacity23 = Capacity.create(name: "Structure et relie les idées relevées", competence: competence5)
capacity24 = Capacity.create(name: "Restitue fidèlement par écrit ou oralement de manière concise l'information", competence: competence5)
capacity25 = Capacity.create(name: "Vérifie à l'aide d'une methode QQOQC ou autre l'intégralite de cette restitution", competence: competence5)

capacity26 = Capacity.create(name: "Définit le but de l'exposé en sélectionnant et structurant les informations", competence: competence6)
capacity27 = Capacity.create(name: "Respecte le temps donné", competence: competence6)
capacity28 = Capacity.create(name: "Se montre détendu face au groupe", competence: competence6)
capacity29 = Capacity.create(name: "Adapte son language à la situation", competence: competence6)
capacity30 = Capacity.create(name: "Rend le discours vivant", competence: competence6)

capacity31 = Capacity.create(name: "Classe et comprend les thematiques principales", competence: competence7)
capacity32 = Capacity.create(name: "Repère les différentes étapes d'une argumentation", competence: competence7)
capacity33 = Capacity.create(name: "Construit les élements de l'argumentation en annoncant un plan de reflexion", competence: competence7)
capacity34 = Capacity.create(name: "Synthetise les élements et prend position", competence: competence7)

capacity35 = Capacity.create(name: "Respecte les consignes", competence: competence8)
capacity36 = Capacity.create(name: "Respecte le rôle attribué", competence: competence8)
capacity37 = Capacity.create(name: "Participe au travail de groupe", competence: competence8)
capacity38 = Capacity.create(name: "Se positionne dans le travail de groupe", competence: competence8)
capacity39 = Capacity.create(name: "Soutient le travail effectué", competence: competence8)

capacity40 = Capacity.create(name: "Respecte les différentes parties de la lettre en reconnaissant à qui je m'adresse et ce qui m'intéresse", competence: competence9)
capacity41 = Capacity.create(name: "Enoncer mes qualités et mes disponibilités", competence: competence9)
capacity42 = Capacity.create(name: "Rédiger les différents paragraphes de la lettre", competence: competence9)
capacity43 = Capacity.create(name: "Valoriser la présentation en rendant le document d'une page A4 agréable à la lecture", competence: competence9)

capacity44 = Capacity.create(name: "Etablit les rubriques conventionnelles d'un CV", competence: competence10)
capacity45 = Capacity.create(name: "Liste et détermines les éléments pertinents de chaque rubrique par ordre chronologique", competence: competence10)
capacity46 = Capacity.create(name: "Personnalise le CV en fonction de son parcours et du destinataire", competence: competence10)
capacity47 = Capacity.create(name: "Valorise la présentation graphique en rendant le document d'une page A4 agréable à la lecture", competence: competence10)

capacity48 = Capacity.create(name: "Se prepare à l'entretien en se renseignant précisement sur l'institution choisie", competence: competence11)
capacity49 = Capacity.create(name: "Prépare quelques questions", competence: competence11)
capacity50 = Capacity.create(name: "Montre son professinalisme en respectant les règles de politesse", competence: competence11)
capacity51 = Capacity.create(name: "Est attentif à son niveau de langage", competence: competence11)
capacity52 = Capacity.create(name: "Répond aux questions de l'entretien avec pertinence et courtoisie", competence: competence11)
capacity53 = Capacity.create(name: "Prend congé en s'assurant du suivi donné (délai de la réponse, documents à donner...)", competence: competence11)


puts 'Création des contextes'
context1 = Context.create(name: "contexte 1", competence: competence3 , classroom: class1 , teacher: teacher1)
context2 = Context.create(name: "contexte 2", competence: competence2 , classroom: class1 , teacher: teacher2 )
context3 = Context.create(name: "contexte 3", competence: competence3 , classroom: class3  , teacher: teacher2)
context4 = Context.create(name: "contexte 4", competence: competence1 , classroom: class1  , teacher: teacher1 )
context5 = Context.create(name: "contexte 5", competence: competence1 , classroom: class2  , teacher: teacher3 )
context6 = Context.create(name: "contexte 6", competence: competence2 , classroom: class1  , teacher: teacher1)
context7 = Context.create(name: "contexte 7", competence: competence1 , classroom: class2 , teacher: teacher2)
context8 = Context.create(name: "contexte 8", competence: competence3 , classroom: class1  , teacher: teacher3 )



#puts 'Création des notes'
note1 = Note.create(student: user1, context: user1.classrooms.first.contexts.first, note_eleve:3,)
#note2 = Note.create(user: user2, context: user2.classrooms.first.contexts.first, note_eleve:2)
#note3 = Note.create(user: user3, context: user3.classrooms.first.contexts.first, note_eleve:1)
#note4 = Note.create(user: user4, context: user4.classrooms.first.contexts.first, note_eleve:3)



#puts 'Création de commentaires'
#comment1 = Comment.create(note: note1, comment:, author:user1)
