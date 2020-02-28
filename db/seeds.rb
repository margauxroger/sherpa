# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'nokogiri'

woman_urls = ["https://randomuser.me/api/portraits/women/47.jpg", "https://randomuser.me/api/portraits/women/43.jpg", "https://randomuser.me/api/portraits/women/38.jpg", "https://randomuser.me/api/portraits/women/8.jpg", "https://randomuser.me/api/portraits/women/57.jpg", "https://randomuser.me/api/portraits/women/13.jpg", "https://randomuser.me/api/portraits/women/78.jpg", "https://randomuser.me/api/portraits/women/9.jpg", "https://randomuser.me/api/portraits/women/69.jpg", "https://randomuser.me/api/portraits/women/10.jpg", "https://randomuser.me/api/portraits/women/93.jpg", "https://randomuser.me/api/portraits/women/79.jpg", "https://randomuser.me/api/portraits/women/73.jpg", "https://randomuser.me/api/portraits/women/89.jpg", "https://randomuser.me/api/portraits/women/67.jpg", "https://randomuser.me/api/portraits/women/83.jpg", "https://randomuser.me/api/portraits/women/23.jpg", "https://randomuser.me/api/portraits/women/86.jpg", "https://randomuser.me/api/portraits/women/85.jpg", "https://randomuser.me/api/portraits/women/11.jpg", "https://randomuser.me/api/portraits/women/63.jpg", "https://randomuser.me/api/portraits/women/90.jpg", "https://randomuser.me/api/portraits/women/37.jpg", "https://randomuser.me/api/portraits/women/6.jpg", "https://randomuser.me/api/portraits/women/30.jpg", "https://randomuser.me/api/portraits/women/91.jpg", "https://randomuser.me/api/portraits/women/16.jpg", "https://randomuser.me/api/portraits/women/88.jpg", "https://randomuser.me/api/portraits/women/92.jpg", "https://randomuser.me/api/portraits/women/39.jpg", "https://randomuser.me/api/portraits/women/2.jpg", "https://randomuser.me/api/portraits/women/28.jpg", "https://randomuser.me/api/portraits/women/45.jpg", "https://randomuser.me/api/portraits/women/68.jpg", "https://randomuser.me/api/portraits/women/33.jpg", "https://randomuser.me/api/portraits/women/62.jpg", "https://randomuser.me/api/portraits/women/3.jpg", "https://randomuser.me/api/portraits/women/65.jpg", "https://randomuser.me/api/portraits/women/32.jpg", "https://randomuser.me/api/portraits/women/22.jpg", "https://randomuser.me/api/portraits/women/70.jpg", "https://randomuser.me/api/portraits/women/76.jpg", "https://randomuser.me/api/portraits/women/40.jpg", "https://randomuser.me/api/portraits/women/21.jpg", "https://randomuser.me/api/portraits/women/64.jpg", "https://randomuser.me/api/portraits/women/66.jpg", "https://randomuser.me/api/portraits/women/31.jpg", "https://randomuser.me/api/portraits/women/53.jpg", "https://randomuser.me/api/portraits/women/80.jpg", "https://randomuser.me/api/portraits/women/17.jpg", "https://randomuser.me/api/portraits/women/14.jpg", "https://randomuser.me/api/portraits/women/58.jpg", "https://randomuser.me/api/portraits/women/81.jpg", "https://randomuser.me/api/portraits/women/0.jpg", "https://randomuser.me/api/portraits/women/27.jpg", "https://randomuser.me/api/portraits/women/71.jpg", "https://randomuser.me/api/portraits/women/50.jpg", "https://randomuser.me/api/portraits/women/4.jpg", "https://randomuser.me/api/portraits/women/12.jpg", "https://randomuser.me/api/portraits/women/49.jpg", "https://randomuser.me/api/portraits/women/29.jpg", "https://randomuser.me/api/portraits/women/24.jpg", "https://randomuser.me/api/portraits/women/54.jpg", "https://randomuser.me/api/portraits/women/60.jpg", "https://randomuser.me/api/portraits/women/48.jpg", "https://randomuser.me/api/portraits/women/52.jpg", "https://randomuser.me/api/portraits/women/26.jpg", "https://randomuser.me/api/portraits/women/34.jpg", "https://randomuser.me/api/portraits/women/36.jpg", "https://randomuser.me/api/portraits/women/82.jpg", "https://randomuser.me/api/portraits/women/1.jpg", "https://randomuser.me/api/portraits/women/77.jpg", "https://randomuser.me/api/portraits/women/74.jpg", "https://randomuser.me/api/portraits/women/72.jpg", "https://randomuser.me/api/portraits/women/15.jpg", "https://randomuser.me/api/portraits/women/35.jpg", "https://randomuser.me/api/portraits/women/20.jpg", "https://randomuser.me/api/portraits/women/55.jpg", "https://randomuser.me/api/portraits/women/42.jpg", "https://randomuser.me/api/portraits/women/41.jpg", "https://randomuser.me/api/portraits/women/25.jpg", "https://randomuser.me/api/portraits/women/19.jpg", "https://randomuser.me/api/portraits/women/46.jpg", "https://randomuser.me/api/portraits/women/7.jpg", "https://randomuser.me/api/portraits/women/87.jpg", "https://randomuser.me/api/portraits/women/18.jpg", "https://randomuser.me/api/portraits/women/51.jpg", "https://randomuser.me/api/portraits/women/5.jpg", "https://randomuser.me/api/portraits/women/75.jpg", "https://randomuser.me/api/portraits/women/44.jpg", "https://randomuser.me/api/portraits/women/94.jpg", "https://randomuser.me/api/portraits/women/59.jpg", "https://randomuser.me/api/portraits/women/61.jpg", "https://randomuser.me/api/portraits/women/56.jpg", "https://randomuser.me/api/portraits/women/84.jpg", "https://randomuser.me/api/portraits/women/undefined.jpg"]
man_urls = ["https://randomuser.me/api/portraits/men/17.jpg", "https://randomuser.me/api/portraits/men/1.jpg", "https://randomuser.me/api/portraits/men/12.jpg", "https://randomuser.me/api/portraits/men/33.jpg", "https://randomuser.me/api/portraits/men/9.jpg", "https://randomuser.me/api/portraits/men/40.jpg", "https://randomuser.me/api/portraits/men/75.jpg", "https://randomuser.me/api/portraits/men/14.jpg", "https://randomuser.me/api/portraits/men/28.jpg", "https://randomuser.me/api/portraits/men/85.jpg", "https://randomuser.me/api/portraits/men/73.jpg", "https://randomuser.me/api/portraits/men/59.jpg", "https://randomuser.me/api/portraits/men/19.jpg", "https://randomuser.me/api/portraits/men/83.jpg", "https://randomuser.me/api/portraits/men/46.jpg", "https://randomuser.me/api/portraits/men/37.jpg", "https://randomuser.me/api/portraits/men/91.jpg", "https://randomuser.me/api/portraits/men/30.jpg", "https://randomuser.me/api/portraits/men/15.jpg", "https://randomuser.me/api/portraits/men/35.jpg", "https://randomuser.me/api/portraits/men/56.jpg", "https://randomuser.me/api/portraits/men/69.jpg", "https://randomuser.me/api/portraits/men/43.jpg", "https://randomuser.me/api/portraits/men/10.jpg", "https://randomuser.me/api/portraits/men/63.jpg", "https://randomuser.me/api/portraits/men/54.jpg", "https://randomuser.me/api/portraits/men/2.jpg", "https://randomuser.me/api/portraits/men/78.jpg", "https://randomuser.me/api/portraits/men/77.jpg", "https://randomuser.me/api/portraits/men/6.jpg", "https://randomuser.me/api/portraits/men/21.jpg", "https://randomuser.me/api/portraits/men/39.jpg", "https://randomuser.me/api/portraits/men/18.jpg", "https://randomuser.me/api/portraits/men/55.jpg", "https://randomuser.me/api/portraits/men/90.jpg", "https://randomuser.me/api/portraits/men/22.jpg", "https://randomuser.me/api/portraits/men/62.jpg", "https://randomuser.me/api/portraits/men/36.jpg", "https://randomuser.me/api/portraits/men/81.jpg", "https://randomuser.me/api/portraits/men/67.jpg", "https://randomuser.me/api/portraits/men/0.jpg", "https://randomuser.me/api/portraits/men/49.jpg", "https://randomuser.me/api/portraits/men/80.jpg", "https://randomuser.me/api/portraits/men/45.jpg", "https://randomuser.me/api/portraits/men/53.jpg", "https://randomuser.me/api/portraits/men/72.jpg", "https://randomuser.me/api/portraits/men/13.jpg", "https://randomuser.me/api/portraits/men/68.jpg", "https://randomuser.me/api/portraits/men/65.jpg", "https://randomuser.me/api/portraits/men/57.jpg", "https://randomuser.me/api/portraits/men/50.jpg", "https://randomuser.me/api/portraits/men/52.jpg", "https://randomuser.me/api/portraits/men/64.jpg", "https://randomuser.me/api/portraits/men/26.jpg", "https://randomuser.me/api/portraits/men/34.jpg", "https://randomuser.me/api/portraits/men/42.jpg", "https://randomuser.me/api/portraits/men/41.jpg", "https://randomuser.me/api/portraits/men/92.jpg", "https://randomuser.me/api/portraits/men/31.jpg", "https://randomuser.me/api/portraits/men/38.jpg", "https://randomuser.me/api/portraits/men/51.jpg", "https://randomuser.me/api/portraits/men/88.jpg", "https://randomuser.me/api/portraits/men/84.jpg", "https://randomuser.me/api/portraits/men/3.jpg", "https://randomuser.me/api/portraits/men/60.jpg", "https://randomuser.me/api/portraits/men/79.jpg", "https://randomuser.me/api/portraits/men/4.jpg", "https://randomuser.me/api/portraits/men/70.jpg", "https://randomuser.me/api/portraits/men/89.jpg", "https://randomuser.me/api/portraits/men/47.jpg", "https://randomuser.me/api/portraits/men/8.jpg", "https://randomuser.me/api/portraits/men/66.jpg", "https://randomuser.me/api/portraits/men/20.jpg", "https://randomuser.me/api/portraits/men/86.jpg", "https://randomuser.me/api/portraits/men/93.jpg", "https://randomuser.me/api/portraits/men/25.jpg", "https://randomuser.me/api/portraits/men/87.jpg", "https://randomuser.me/api/portraits/men/82.jpg", "https://randomuser.me/api/portraits/men/16.jpg", "https://randomuser.me/api/portraits/men/74.jpg", "https://randomuser.me/api/portraits/men/7.jpg", "https://randomuser.me/api/portraits/men/27.jpg", "https://randomuser.me/api/portraits/men/76.jpg", "https://randomuser.me/api/portraits/men/44.jpg", "https://randomuser.me/api/portraits/men/71.jpg", "https://randomuser.me/api/portraits/men/29.jpg", "https://randomuser.me/api/portraits/men/61.jpg", "https://randomuser.me/api/portraits/men/58.jpg", "https://randomuser.me/api/portraits/men/23.jpg", "https://randomuser.me/api/portraits/men/94.jpg", "https://randomuser.me/api/portraits/men/24.jpg", "https://randomuser.me/api/portraits/men/32.jpg", "https://randomuser.me/api/portraits/men/5.jpg", "https://randomuser.me/api/portraits/men/48.jpg", "https://randomuser.me/api/portraits/men/11.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg"]

def student_trains_on_flashcards(student, material)
  material.flashcards.each do |flashcard|
    UserAnswer.create!(user_id: student.id,
                       flashcard_id: flashcard.id,
                       status: UserAnswer::STATUSES[rand(0..2)],
                       )
  end
end

puts "Destroying all"

User.destroy_all
Division.destroy_all

puts "Creating teachers"

teacher1 = User.create!(
  email:    "remi.charette@gmail.com",
  password: "azerty",
  role:     "teacher",
)

teacher2 = User.create!(

  email:    "diogo.heineken@gmail.com",
  password: "azerty",
  role:     "teacher",
)

puts "Creating 4 different divisions, each containing 40 students"

# user = JSON.parse(open('https://randomuser.me/api/').read)["results"].first
# # p user["results"]
# p user["name"]
# p user["name"]["first"]

div1 = Division.create!(
         name:  "Term. S2",
         level: "Terminale"
         )
40.times do
  user = JSON.parse(open('https://randomuser.me/api/').read)["results"].first
  user_instance = User.new( first_name: user["name"]["first"],
                            last_name:  user["name"]["last"],
                            email: user["email"],
                            password: 'azerty',
                            division_id: div1.id,
                            )
  user_instance.picture_url = user["gender"] == "male" ? man_urls[rand(0...man_urls.length)] : woman_urls[rand(0...woman_urls.length)]
  user_instance.save!
end

div2 = Division.create!(
         name:  "Prem. ES3",
         level: "Première"
         )
40.times do
  user = JSON.parse(open('https://randomuser.me/api/').read)["results"].first
  user_instance = User.new( first_name: user["name"]["first"],
                            last_name:  user["name"]["last"],
                            email: user["email"],
                            password: 'azerty',
                            division_id: div1.id,
                            )
  user_instance.picture_url = user["gender"] == "male" ? man_urls[rand(0...man_urls.length)] : woman_urls[rand(0...woman_urls.length)]
  user_instance.save!
end

div3 = Division.create!(
         name:  "Term. L1",
         level: "Terminale"
         )
40.times do
  user = JSON.parse(open('https://randomuser.me/api/').read)["results"].first
  user_instance = User.new( first_name: user["name"]["first"],
                            last_name:  user["name"]["last"],
                            email: user["email"],
                            password: 'azerty',
                            division_id: div1.id,
                            )
  user_instance.picture_url = user["gender"] == "male" ? man_urls[rand(0...man_urls.length)] : woman_urls[rand(0...woman_urls.length)]
  user_instance.save!
end

div4 = Division.create!(
         name:  "Sec. 1",
         level: "Seconde"
         )
40.times do
  user = JSON.parse(open('https://randomuser.me/api/').read)["results"].first
  user_instance = User.new( first_name: user["name"]["first"],
                            last_name:  user["name"]["last"],
                            email: user["email"],
                            password: 'azerty',
                            division_id: div1.id,
                            )
  user_instance.picture_url = user["gender"] == "male" ? man_urls[rand(0...man_urls.length)] : woman_urls[rand(0...woman_urls.length)]
  user_instance.save!
end

puts "Creating amazing course materials"

hist_term_s = Material.create!(
              name:     "History for Term. S classes",
              category: "History",
              )

hist_term_s_chap1 = Chapter.create!(
  name: "Une gouvernance économique mondiale depuis 1975",
  content: "La « gouvernance » est un processus de décision qui associe des acteurs divers, à
    différentes échelles, sans être forcément officiel ou institutionnel. Appliqué à l’économie, on parle de
    « gouvernance économique mondiale » : il s’agit de la mise en place, par des acteurs divers, d’un système de
    règles économiques, financières et monétaires dans l’intérêt général, dépassant celui des seuls Etats. Ce
    concept s’est imposé pendant la Seconde Guerre mondiale, alors qu’une prise de conscience a eu lieu : l’essor
    de régimes totalitaires et la marche à la guerre ont été favorisés par la crise économique de 1929. Né donc le
    désir d’assurer l’ordre économique pour garantir la paix. Le premier système de gouvernance économique
    mondiale est mis en place en 1944, à la conférence de Bretton Woods. Dominé par les Etats-Unis, il prévoyait :
    le libre-échange, un système monétaire stable (le Gold Exchange Standard dans lequel seul le dollar est
    convertible en or et les autres monnaies sont indexées sur le dollar), et la création d’institutions internationales
    sous l’égide de l’ONU, pour garantir le système (FMI, BIRD et GATT, un accord signé en 1947 sur les tarifs
    douaniers pour favoriser le libre-échange). Cette première forme de gouvernance économique mondiale,
    dominée par les Etats-Unis, est néanmoins remise en cause par les rythmes économiques (nouvelles crises dans
    les années 1970, etc.), et par de nouveaux acteurs (puissances émergentes, etc.). C’est pourquoi la
    gouvernance économique mondiale a dû s’ajuster à de nombreuses reprises : ainsi 1975 a marqué sa première
    grande redéfinition, les Etats-Unis perdant leur mainmise hégémonique sur l’économie mondiale par la
    création du G6 (rapidement devenu G7).
    Comment la gouvernance économique mondiale s’est-elle adaptée, depuis 1975, aux
    crises économiques et aux défis de la mondialisation ? <br>

    En effet les Etats-Unis, pour financer la guerre du Vietnam
    et la course à l’espace, ont épuisé leurs stocks d’or et ont émis des grandes quantités de dollars : le dollar perd
    donc une grande part de sa valeur du fait de l’indexation du dollar sur l’or, et les prix augmentent partout dans
    le monde puisque les autres monnaies sont indexées sur le dollar. En 1971, en conséquence, le président
    américain Robert Nixon décide unilatéralement de mettre fin au Gold Exchange Standard : le cours des
    monnaies devient flottant, et toutes les monnaies sont davantage soumises aux fluctuations rapides du dollar,
    ce qui perturbe le commerce mondial. En réaction, en 1976, par les « accords de la Jamaïque », pour rendre
    aux Etats leur indépendance monétaire vis-à-vis des Etats-Unis, il est décidé que la valeur des monnaies n’est
    plus indexée sur le dollar mais sur l’offre et la demande : l’instabilité monétaire en est accrue. Dans ce
    contexte, les institutions comme le FMI ne sont pas capables de ramener de la stabilité, ce qui marque l’échec
    d’une gouvernance vraiment mondiale : les Etats-Unis, en tant que première puissance mondiale, déterminent
    toujours par leur contrôle du dollar une bonne part de l’économie mondiale. A cela se rajoute, en 1973 et
    1979, les « chocs pétroliers » et leurs conséquences : les pays producteurs de pétrole (OPEP) augmentent
    brutalement le prix du pétrole, matière première essentielle, d’où une inflation, une récession économique et
    une hausse du chômage dans les pays industrialisés. Enfin, alors que le système de Bretton Woods était censé
    garantir le développement partout dans le monde (avec la BIRD, Banque mondiale pour la reconstruction et le
    développement), les pays pauvres, déjà fragiles, sont rapidement surendettés à cause des chocs pétroliers et
    des variations brutales du dollar : ces états, souvent décolonisés, ne peuvent plus rembourser ce qu’ils ont
    emprunté auprès du FMI et de la Banque mondiale pour se développer. A leurs yeux, le « système de Bretton
    Woods » est au bénéfice exclusif des pays du « Nord » : ils militent pour un nouvel ordre économique mondial,
    un rééquilibrage Nord-Sud. Le milieu des années 1970 marque donc l’échec de la première forme de
    gouvernance économique mondiale, fondée sur la coopération des états, des règles internationales parfois
    strictes (règles monétaires par exemple), et la domination des Etats-Unis.

     En 1991, le contexte économique mondial
    change profondément. Avant, la gouvernance (sur le mode libéral) ne pouvait pas être pleinement mondial
    puisque de nombreux états avaient un fonctionnement économique communiste. Avec l’explosion du bloc
    soviétique, le modèle libéral n’a plus face à lui de contre-modèle. Dans le même temps commence à se
    dessiner un monde multipolaire, avec l’émergence de nouvelles grandes puissances économiques, les BRICS
    (terme utilisé pour la première fois en 2001). De même, avec la mise en circulation de l’€ en 2002, le dollar
    n’apparait plus hégémonique : même l’équilibre monétaire mondial apparait désormais multipolaire. En
    conséquence, les institutions de la gouvernance économique mondiale s’adaptent pour refléter ces deux
    grandes évolutions : davantage de multipolarité (le G7 devient le G8 en 1997, s’élargissant à la Russie), et
    triomphe du libéralisme (le GATT, simple accord parfois mis à jour, est supprimé puis remplacé en 1995 par
    l’OMC, véritable institution internationale destinée à renforcer le libre-échange mondial par un système de
    sanctions, et à l’élargir à de nouveaux domaines. En parallèles, de nouveaux acteurs s’imposent aux côtés des
    états et des institutions : le « World Economic Forum » de Davos (en Suisse) prend de l’ampleur dans les années
    1990. Financé des multinationales, il consiste en une rencontre annuelle des principaux décideurs politiques et
    économiques du monde libéral (politiques, chefs d’entreprise de grandes FTN, journalistes, etc.).

    Plus récemment, la gouvernance économique
    mondiale telle qu’elle s’exerce depuis 1975 apparait de plus en plus fragilisée. Ainsi, dans les années 2010,
    l’OMC peine à faire progresser le libre-échange, car dans un contexte de crise, les états se replient sur leurs
    propres intérêts, de plus en plus divergents. Par exemple, en 2017, un cycle de négociation multilatéral sur
    l’agriculture échoue. Désormais, la gouvernance mondiale semble céder le pas à une gouvernance plus
    restreinte : renforcement des organisation régionales (UE, Mercosur, etc.), et négociations bilatérales (en 2016
    est signé l’accord commercial CETA, entre l’U.E. et le Canada, destiné à favoriser les échanges entre ces deux
    pôles). Plus récemment encore se dessine une montée des protectionnismes : depuis l’arrivée au pouvoir de
    Donald Trump, les Etats-Unis multiplient ainsi les mesures de défense de leur économie, au détriment du libreéchange (importations chinoises taxées à 25% en 2018, etc.). Les « guerres commerciales » qui en découlent
    mettent à mal la coopération économique mondiale. Enfin, des acteurs nouveaux s’imposent et dénoncent les
    dérives de la mondialisation, qu’ils voient comme les conséquences de la gouvernance économique libérale. Ce
    sont les ONG, émanations de la société civile, comme ATTAC, fondée en France en 1998 pour obtenir une
    taxation sur les transactions financières dont le produit irait au développement des pays du Sud. Ces
    mouvements altermondialistes proposent des voies moins libérales et plus démocratiques : selon elles, la
    gouvernance mondiale ne l’est pas vraiment, « mondiale ». Ces ONG désirent donc davantage de régulation, et
    une véritable intégration des pays pauvres aux prises de décisions des institutions internationales. A partir de
    2001, ces mouvements défendent leurs idées lors d’un « contre-Davos » : le « Forum social mondial ». Il est
    enfin exigé par une part croissante de la société civile (ONG, experts scientifiques, groupes de pression sur les
    réseaux sociaux, etc.) que la gouvernance mondiale soit plus écologique, pour limiter l’impact de l’économie
    sur l’environnement. Mais malgré quelques accords comme celui de Paris en 2015 (premier « accord universel
    »), les actions concrètes tardent à être prises et il n’existe pas de véritable mécanisme contraignant (sanctions
    financières, etc.).",
  material_id: hist_term_s.id,
  )

hist_term_s_chap1_fc1 = Flashcard.create!(
                          question: "Qu'est-ce que la gouvernance?",
                          answer:   "La « gouvernance » est un processus de décision qui associe des acteurs divers, à
    différentes échelles, sans être forcément officiel ou institutionnel.",
                          chapter_id: hist_term_s_chap1.id,
                        )

hist_term_s_chap1_fc2 = Flashcard.create!(
                          question: "Quand et où le premier système de gouvernance économique a-t-il été mis en place?",
                          answer:   "Le premier système de gouvernance économique
    mondiale est mis en place en 1944, à la conférence de Bretton Woods.",
                          chapter_id: hist_term_s_chap1.id,
                        )

hist_term_s_chap1_fc3 = Flashcard.create!(
                          question: "Comment les US ont-ils financé la guerre du Vietnam et la Course à l'Espace ?",
                          answer:   "les Etats-Unis, pour financer la guerre du Vietnam
    et la course à l’espace, ont épuisé leurs stocks d’or et ont émis des grandes quantités de dollars : le dollar perd
    donc une grande part de sa valeur du fait de l’indexation du dollar sur l’or, et les prix augmentent partout dans
    le monde puisque les autres monnaies sont indexées sur le dollar.",
                          chapter_id: hist_term_s_chap1.id,
                        )

hist_term_s_chap1_fc4 = Flashcard.create!(
                          question: "Le libre-échange est-il en progrès ou en contraction dans les années 2010?",
                          answer:   "Dans les années 2010,
    l’OMC peine à faire progresser le libre-échange, car dans un contexte de crise, les états se replient sur leurs
    propres intérêts, de plus en plus divergents.",
                          chapter_id: hist_term_s_chap1.id,
                        )

hist_term_s_chap1_fc5 = Flashcard.create!(
                          question: "Citez un acteur de la société civile qui dénonce la mondialisation",
                          answer:   "Des acteurs nouveaux s’imposent et dénoncent les
    dérives de la mondialisation, qu’ils voient comme les conséquences de la gouvernance économique libérale. Ce
    sont les ONG, émanations de la société civile, comme ATTAC, fondée en France en 1998 pour obtenir une
    taxation sur les transactions financières dont le produit irait au développement des pays du Sud.",
                          chapter_id: hist_term_s_chap1.id,
                        )

hist_term_s_chap2 = Chapter.create!(
  name:    "Une gouvernance européenne depuis le traité de Maastricht",
  content: "En 1992, le traité de Maastricht permet la réalisation effective d'une union économique européenne qui aboutit à la mise en circulation de l'euro en 2002. L'Europe poursuit son élargissement après la chute du bloc de l'Est et le nombre des États membres augmente jusqu'à 28 en 2013.
    Les traités de Nice et d'Amsterdam ne semblent pas suffisants pour gouverner une Europe qui s'agrandit et le traité sur la Constitution de l'Europe est refusé par référendum en 2005. Il faut attendre le traité de Lisbonne en 2007 pour voir se mettre en place des changements dans la gouvernance européenne.
    Malgré ces avancées, les élargissements de l'Europe suscitent des critiques.
    Le traité de Maastricht intervient dans le contexte de la chute du mur de Berlin en 1989 et de la fin de l'URSS en 1991, marquant la fin de la guerre froide.
    Le président français, François Mitterrand, inquiet de cette situation, demande aux Allemands d'abandonner le Mark (la monnaie allemande) au profit d'une monnaie commune aux États membres de la CEE.
    Plusieurs raisons ont concouru à la rédaction de ce
    nouveau traité. La fin de la Guerre froide en 1991 ouvre les pays d’Europe de l’est à la démocratie et au
    libéralisme économique : elle laisse entrevoir la possibilité de nouveaux élargissements de la CEE. L’incapacité
    de la gouvernance mondiale à mettre fin aux crises et la volonté de s’émanciper de l’économie américaine
    pousse par ailleurs les Etats membres de la CEE à désirer une plus grande coopération économique, mais aussi
    politique. Enfin, ailleurs, les processus d’intégration régionale se multiplient (ASEAN en 1967, MERCOSUR en
    1991) : il s’agit pour les Européens d’aller plus loin que ces autres ensembles, pour s’affirmer davantage. Dès
    1987, le président de la Commission européenne (organe exécutif de la CEE), Jacques Delors, fait des
    propositions pour approfondir la construction européenne. En février 1992, les chefs d’Etats et de
    gouvernements des 12 membres de la CEE signent le traité de Maastricht, qui est ensuite ratifié par les
    Parlements nationaux ou par referendums, avec difficultés parfois (le « oui » l’emporte de justesse en France, à
    51%, en septembre 1992). Le 1er novembre 1993, le traité entre en en vigueur : la C.E.E. devient l’U.E.
    L’U.E. n’est en effet pas la seule organisation européenne :
    la gouvernance européenne dépasse ses dimensions, avec la mise en place dans les années 1990
    essentiellement de politiques communes liées à l’U.E. mais qui ne s’y superposent pas (et n’en dépendent pas
    vraiment, même s’il faut le plus souvent être membre de l’U.E. pour intégrer ces politiques communes). Ainsi
    en 1995, c’est l’entrée en vigueur de la « convention de Schengen » : il s’agit de favoriser la libre-circulation des
    hommes, des biens, des capitaux et des informations entre les Etats signataires (26 états, dont 22 membres de
    l’U.E.) par l’abolition des frontières intérieures à l’espace Schengen (et un contrôle renforcé et commun des
    frontières extérieures de cet espace). De même, en 1998, une véritable « Union économique et monétaire
    (UEM) » prend forme avec la création d’une nouvelle institution, la « Banque centrale européenne » : son siège
    est à Francfort (Allemagne), et son actuel président est Mario Draghi. Elle est d’abord chargée de garantir la
    stabilité des prix dans la zone euro, et en assure la gouvernance monétaire. En 2002, la BCE met en circulation
    une monnaie unique dans 12 Etats de l’U.E. (actuellement 19 pays membres) : l’euro. Cette politique monétaire
    était prévue par le traité de Maastricht mais fonctionne indépendamment de l’U.E. A noter enfin l’existence
    d’une juridiction européenne qui dépasse les cadres de l’U.E. : la Cour européenne des droits de l’homme, qui
    voit son pouvoir renforcé en 1998 (obtention d’un siège à Strasbourg lui permettant de siéger de manière
    permanente, et possibilité d’une saisine par des personnes physiques). Elle compte 47 états membres (ceux du
    « Conseil de l’Europe ») et veille au respect des principes de la « Convention européenne des droits de
    l’homme » (1950). On le voit, à la fin des années 1990, la gouvernance européenne ne se limite clairement pas
    à l’U.E., mais connait plusieurs dimensions. De plus, elle est confrontée aux élargissements successifs et
    importants de l’U.E.
    L’UE a mis en place plusieurs structures qui ne se superposent pas
    pleinement à elle, et qui donnent naissance à des frontières européennes de multiples natures : la zone euro et
    l’espace Schengen. En effet, avec l’officialisation en 2007 de la procédure d’opting out, les Etats membres de
    l'UE sont libres d’adhérer ou pas à des projets européens. Autrement dit les membres de l’U.E. ont certes des
    obligations communes (critères d’adhésion de 1993), mais des degrés d’implication divergents. Ainsi, depuis les
    années 1990, certains s’excluent de l’UEM (Union monétaire) par choix, comme le Royaume-Uni ou la Suède, et
    d’autres en sont exclus car ils ne répondent pas à certains critères économiques comme le taux d’endettement
    (Roumanie, Bulgarie). A contrario, des états non-membres de l’U.E. font partie de l’Espace Schengen (Islande,
    Suisse). Cela donne naissance à une véritable « Europe a géométrie variable », dans laquelle chaque pays
    participerait ou non à telle politique commune en fonction de ses intérêts propres. Cela nuit à l’efficacité de sa
    gouvernance, mais surtout questionne la notion même de « gouvernance européenne » : celle-ci semble ne pas
    exister au singulier, mais au pluriel. Plusieurs structures se chevauchent imparfaitement, rendant complexe la
    mise en place d’une gouvernance claire et efficace.",
  material_id: hist_term_s.id,
  )

hist_term_s_chap2_fc1 = Flashcard.create!(
                          question:   "Quand le traité de Maastricht a-t-il été signé ?",
                          answer:     "En 1992.",
                          chapter_id: hist_term_s_chap2.id,
                        )

hist_term_s_chap2_fc2 = Flashcard.create!(
                          question:   "Quels sont les effets de la fin de la Guerre Froide pour les pays du Bloc Soviétique vis-à-vis de l'UE?",
                          answer:     "La fin de la Guerre froide en 1991 ouvre les pays d’Europe de l’est à la démocratie et au
    libéralisme économique : elle laisse entrevoir la possibilité de nouveaux élargissements de la CEE.",
                          chapter_id: hist_term_s_chap2.id,
                          )

hist_term_s_chap2_fc3 = Flashcard.create!(
                          question:   "Les pays membres de l'UE doivent-ils tous adhérer à chaque politique adoptée?",
                          answer:     "Avec l’officialisation en 2007 de la procédure d’opting out, les Etats membres de
    l'UE sont libres d’adhérer ou pas à des projets européens.",
                          chapter_id: hist_term_s_chap2.id,
                        )

hist_term_s_chap2_fc4 = Flashcard.create!(
                          question: "Tous les pays membres de l'Espace Schengen sont-ils membres de l'UE?",
                          answer: "Des états non-membres de l’U.E. font partie de l’Espace Schengen (Islande,
    Suisse). Cela donne naissance à une véritable « Europe a géométrie variable », dans laquelle chaque pays
    participerait ou non à telle politique commune en fonction de ses intérêts propres.",
                          chapter_id: hist_term_s_chap2.id,
                        )

hist_term_s_chap2_fc5 = Flashcard.create!(
                          question:   "L'UE est-elle la seule organisation européenne?",
                          answer:     "L’U.E. n’est en effet pas la seule organisation européenne :
    la gouvernance européenne dépasse ses dimensions, avec la mise en place dans les années 1990
    essentiellement de politiques communes liées à l’U.E. mais qui ne s’y superposent pas (et n’en dépendent pas
    vraiment, même s’il faut le plus souvent être membre de l’U.E. pour intégrer ces politiques communes).",
                          chapter_id: hist_term_s_chap2.id,
                          )



maths_prem_es = Material.create!(
  name: "Maths for Prem. ES classes",
  category: "Maths"
  )

maths_prem_es_chap1 = Chapter.create!(
  name: "Polynômes et équations du second degré",
  content: "On appelle polynôme (ou trinôme) du second degré toute expression pouvant se mettre sous la forme :
    On rappelle que les solutions de l'équation
    f(x)=0
     sont les abscisses des points d'intersection de la courbe
    C_{f}Cf
     et de l'axe des abscisses.
    En regroupant les propriétés de ce chapitre et celles vues en Seconde on peut résumer ces résultats dans le tableau :",
  material_id: maths_prem_es.id,
  )

maths_prem_es_chap1_fc1 = Flashcard.create!(
                          question:   "Quelle est la forme d'une équation du second degré ?",
                          answer:     "aX + bX^2 + c",
                          chapter_id: maths_prem_es_chap1.id,
                        )

maths_prem_es_chap1_fc2 = Flashcard.create!(
                          question: "Qu'est-ce que l'ordonnée à l'origine ?",
                          answer: "La valeur de la fonction pour x = 0",
                          chapter_id: maths_prem_es_chap1.id,
                        )

maths_prem_es_chap1_fc3 = Flashcard.create!(
                          question:   "Où est l'axe des abscisses?",
                          answer:     "En bas.",
                          chapter_id: maths_prem_es_chap1.id,
                          )


maths_prem_es_chap2 = Chapter.create!(
  name: "Etude de fonctions",
  content: "Une fonction associe, à tout nombre réel. Cette définition est importante car elle établit un lien entre la courbe représentative d'une fonction et la formule définissant la fonction. Elle permet de déterminer notamment si un point appartient à la courbe représentative d'une fonction.
    La fonction racine carrée est strictement croissante sur
    left[0;+infinity right[[0;+∞[",
  material_id: maths_prem_es.id,
  )

maths_prem_es_chap2_fc1 = Flashcard.create!(
                          question:   "La fonction racine carrée est-elle croissante ou décroissante pour tout réel positif ?",
                          answer:     "Elle est croissante",
                          chapter_id: maths_prem_es_chap2.id,
                        )

maths_prem_es_chap2_fc2 = Flashcard.create!(
                          question:   "Qu'est-ce qu'une fonction affine ?",
                          answer:     "Une fonction de la forme aX + b",
                          chapter_id: maths_prem_es_chap2.id,
                        )

maths_prem_es_chap2_fc3 = Flashcard.create!(
                          question:   "Comment savoir si un point donné appartient à la courbe représentative d'une fonction ?",
                          answer:     "On calcule l'image de l'abscisses par la fonction en question. Si ce résultat est égal à l'ordonnée du point, alors celui-ci appartient à la courbe représentative de la fonction.",
                          chapter_id: maths_prem_es_chap2.id,
                          )

puts "Assigning awesome students to brilliant teachers"

course1 = Course.create!(
            division: div1,
            material: hist_term_s,
            user_id: teacher1.id)

course2 = Course.create!(
            division: div2,
            material: maths_prem_es,
            user_id: teacher2.id)

course3 = Course.create!(
            division: div2,
            material: hist_term_s,
            user_id: teacher1.id)

course4 = Course.create!(
            division: div3,
            material: hist_term_s,
            user_id: teacher1.id)

forum1 = Forum.create!(
            topic: "Histoire TS1",
            course_id: course1.id)

message1 = Message.create!(
            user_id: 3,
            content: "Bonjour, j'ai une question sur le 1er chapitre")


div1.users.each do |student|
  student_trains_on_flashcards(student, hist_term_s)
end

div2.users.each do |student|
  student_trains_on_flashcards(student, maths_prem_es)
end

