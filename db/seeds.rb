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
require 'faker'

woman_urls = ["https://randomuser.me/api/portraits/women/47.jpg", "https://randomuser.me/api/portraits/women/43.jpg", "https://randomuser.me/api/portraits/women/38.jpg", "https://randomuser.me/api/portraits/women/8.jpg", "https://randomuser.me/api/portraits/women/57.jpg", "https://randomuser.me/api/portraits/women/13.jpg", "https://randomuser.me/api/portraits/women/78.jpg", "https://randomuser.me/api/portraits/women/9.jpg", "https://randomuser.me/api/portraits/women/69.jpg", "https://randomuser.me/api/portraits/women/10.jpg", "https://randomuser.me/api/portraits/women/93.jpg", "https://randomuser.me/api/portraits/women/79.jpg", "https://randomuser.me/api/portraits/women/73.jpg", "https://randomuser.me/api/portraits/women/89.jpg", "https://randomuser.me/api/portraits/women/67.jpg", "https://randomuser.me/api/portraits/women/83.jpg", "https://randomuser.me/api/portraits/women/23.jpg", "https://randomuser.me/api/portraits/women/86.jpg", "https://randomuser.me/api/portraits/women/85.jpg", "https://randomuser.me/api/portraits/women/11.jpg", "https://randomuser.me/api/portraits/women/63.jpg", "https://randomuser.me/api/portraits/women/90.jpg", "https://randomuser.me/api/portraits/women/37.jpg", "https://randomuser.me/api/portraits/women/6.jpg", "https://randomuser.me/api/portraits/women/30.jpg", "https://randomuser.me/api/portraits/women/91.jpg", "https://randomuser.me/api/portraits/women/16.jpg", "https://randomuser.me/api/portraits/women/88.jpg", "https://randomuser.me/api/portraits/women/92.jpg", "https://randomuser.me/api/portraits/women/39.jpg", "https://randomuser.me/api/portraits/women/2.jpg", "https://randomuser.me/api/portraits/women/28.jpg", "https://randomuser.me/api/portraits/women/45.jpg", "https://randomuser.me/api/portraits/women/68.jpg", "https://randomuser.me/api/portraits/women/33.jpg", "https://randomuser.me/api/portraits/women/62.jpg", "https://randomuser.me/api/portraits/women/3.jpg", "https://randomuser.me/api/portraits/women/65.jpg", "https://randomuser.me/api/portraits/women/32.jpg", "https://randomuser.me/api/portraits/women/22.jpg", "https://randomuser.me/api/portraits/women/70.jpg", "https://randomuser.me/api/portraits/women/76.jpg", "https://randomuser.me/api/portraits/women/40.jpg", "https://randomuser.me/api/portraits/women/21.jpg", "https://randomuser.me/api/portraits/women/64.jpg", "https://randomuser.me/api/portraits/women/66.jpg", "https://randomuser.me/api/portraits/women/31.jpg", "https://randomuser.me/api/portraits/women/53.jpg", "https://randomuser.me/api/portraits/women/80.jpg", "https://randomuser.me/api/portraits/women/17.jpg", "https://randomuser.me/api/portraits/women/14.jpg", "https://randomuser.me/api/portraits/women/58.jpg", "https://randomuser.me/api/portraits/women/81.jpg", "https://randomuser.me/api/portraits/women/0.jpg", "https://randomuser.me/api/portraits/women/27.jpg", "https://randomuser.me/api/portraits/women/71.jpg", "https://randomuser.me/api/portraits/women/50.jpg", "https://randomuser.me/api/portraits/women/4.jpg", "https://randomuser.me/api/portraits/women/12.jpg", "https://randomuser.me/api/portraits/women/49.jpg", "https://randomuser.me/api/portraits/women/29.jpg", "https://randomuser.me/api/portraits/women/24.jpg", "https://randomuser.me/api/portraits/women/54.jpg", "https://randomuser.me/api/portraits/women/60.jpg", "https://randomuser.me/api/portraits/women/48.jpg", "https://randomuser.me/api/portraits/women/52.jpg", "https://randomuser.me/api/portraits/women/26.jpg", "https://randomuser.me/api/portraits/women/34.jpg", "https://randomuser.me/api/portraits/women/36.jpg", "https://randomuser.me/api/portraits/women/82.jpg", "https://randomuser.me/api/portraits/women/1.jpg", "https://randomuser.me/api/portraits/women/77.jpg", "https://randomuser.me/api/portraits/women/74.jpg", "https://randomuser.me/api/portraits/women/72.jpg", "https://randomuser.me/api/portraits/women/15.jpg", "https://randomuser.me/api/portraits/women/35.jpg", "https://randomuser.me/api/portraits/women/20.jpg", "https://randomuser.me/api/portraits/women/55.jpg", "https://randomuser.me/api/portraits/women/42.jpg", "https://randomuser.me/api/portraits/women/41.jpg", "https://randomuser.me/api/portraits/women/25.jpg", "https://randomuser.me/api/portraits/women/19.jpg", "https://randomuser.me/api/portraits/women/46.jpg", "https://randomuser.me/api/portraits/women/7.jpg", "https://randomuser.me/api/portraits/women/87.jpg", "https://randomuser.me/api/portraits/women/18.jpg", "https://randomuser.me/api/portraits/women/51.jpg", "https://randomuser.me/api/portraits/women/5.jpg", "https://randomuser.me/api/portraits/women/75.jpg", "https://randomuser.me/api/portraits/women/44.jpg", "https://randomuser.me/api/portraits/women/94.jpg", "https://randomuser.me/api/portraits/women/59.jpg", "https://randomuser.me/api/portraits/women/61.jpg", "https://randomuser.me/api/portraits/women/56.jpg", "https://randomuser.me/api/portraits/women/84.jpg", "https://randomuser.me/api/portraits/women/undefined.jpg"]
man_urls = ["https://randomuser.me/api/portraits/men/17.jpg", "https://randomuser.me/api/portraits/men/1.jpg", "https://randomuser.me/api/portraits/men/12.jpg", "https://randomuser.me/api/portraits/men/33.jpg", "https://randomuser.me/api/portraits/men/9.jpg", "https://randomuser.me/api/portraits/men/40.jpg", "https://randomuser.me/api/portraits/men/75.jpg", "https://randomuser.me/api/portraits/men/14.jpg", "https://randomuser.me/api/portraits/men/28.jpg", "https://randomuser.me/api/portraits/men/85.jpg", "https://randomuser.me/api/portraits/men/73.jpg", "https://randomuser.me/api/portraits/men/59.jpg", "https://randomuser.me/api/portraits/men/19.jpg", "https://randomuser.me/api/portraits/men/83.jpg", "https://randomuser.me/api/portraits/men/46.jpg", "https://randomuser.me/api/portraits/men/37.jpg", "https://randomuser.me/api/portraits/men/91.jpg", "https://randomuser.me/api/portraits/men/30.jpg", "https://randomuser.me/api/portraits/men/15.jpg", "https://randomuser.me/api/portraits/men/35.jpg", "https://randomuser.me/api/portraits/men/56.jpg", "https://randomuser.me/api/portraits/men/69.jpg", "https://randomuser.me/api/portraits/men/43.jpg", "https://randomuser.me/api/portraits/men/10.jpg", "https://randomuser.me/api/portraits/men/63.jpg", "https://randomuser.me/api/portraits/men/54.jpg", "https://randomuser.me/api/portraits/men/2.jpg", "https://randomuser.me/api/portraits/men/78.jpg", "https://randomuser.me/api/portraits/men/77.jpg", "https://randomuser.me/api/portraits/men/6.jpg", "https://randomuser.me/api/portraits/men/21.jpg", "https://randomuser.me/api/portraits/men/39.jpg", "https://randomuser.me/api/portraits/men/18.jpg", "https://randomuser.me/api/portraits/men/55.jpg", "https://randomuser.me/api/portraits/men/90.jpg", "https://randomuser.me/api/portraits/men/22.jpg", "https://randomuser.me/api/portraits/men/62.jpg", "https://randomuser.me/api/portraits/men/36.jpg", "https://randomuser.me/api/portraits/men/81.jpg", "https://randomuser.me/api/portraits/men/67.jpg", "https://randomuser.me/api/portraits/men/0.jpg", "https://randomuser.me/api/portraits/men/49.jpg", "https://randomuser.me/api/portraits/men/80.jpg", "https://randomuser.me/api/portraits/men/45.jpg", "https://randomuser.me/api/portraits/men/53.jpg", "https://randomuser.me/api/portraits/men/72.jpg", "https://randomuser.me/api/portraits/men/13.jpg", "https://randomuser.me/api/portraits/men/68.jpg", "https://randomuser.me/api/portraits/men/65.jpg", "https://randomuser.me/api/portraits/men/57.jpg", "https://randomuser.me/api/portraits/men/50.jpg", "https://randomuser.me/api/portraits/men/52.jpg", "https://randomuser.me/api/portraits/men/64.jpg", "https://randomuser.me/api/portraits/men/26.jpg", "https://randomuser.me/api/portraits/men/34.jpg", "https://randomuser.me/api/portraits/men/42.jpg", "https://randomuser.me/api/portraits/men/41.jpg", "https://randomuser.me/api/portraits/men/92.jpg", "https://randomuser.me/api/portraits/men/31.jpg", "https://randomuser.me/api/portraits/men/38.jpg", "https://randomuser.me/api/portraits/men/51.jpg", "https://randomuser.me/api/portraits/men/88.jpg", "https://randomuser.me/api/portraits/men/84.jpg", "https://randomuser.me/api/portraits/men/3.jpg", "https://randomuser.me/api/portraits/men/60.jpg", "https://randomuser.me/api/portraits/men/79.jpg", "https://randomuser.me/api/portraits/men/4.jpg", "https://randomuser.me/api/portraits/men/70.jpg", "https://randomuser.me/api/portraits/men/89.jpg", "https://randomuser.me/api/portraits/men/47.jpg", "https://randomuser.me/api/portraits/men/8.jpg", "https://randomuser.me/api/portraits/men/66.jpg", "https://randomuser.me/api/portraits/men/20.jpg", "https://randomuser.me/api/portraits/men/86.jpg", "https://randomuser.me/api/portraits/men/93.jpg", "https://randomuser.me/api/portraits/men/25.jpg", "https://randomuser.me/api/portraits/men/87.jpg", "https://randomuser.me/api/portraits/men/82.jpg", "https://randomuser.me/api/portraits/men/16.jpg", "https://randomuser.me/api/portraits/men/74.jpg", "https://randomuser.me/api/portraits/men/7.jpg", "https://randomuser.me/api/portraits/men/27.jpg", "https://randomuser.me/api/portraits/men/76.jpg", "https://randomuser.me/api/portraits/men/44.jpg", "https://randomuser.me/api/portraits/men/71.jpg", "https://randomuser.me/api/portraits/men/29.jpg", "https://randomuser.me/api/portraits/men/61.jpg", "https://randomuser.me/api/portraits/men/58.jpg", "https://randomuser.me/api/portraits/men/23.jpg", "https://randomuser.me/api/portraits/men/94.jpg", "https://randomuser.me/api/portraits/men/24.jpg", "https://randomuser.me/api/portraits/men/32.jpg", "https://randomuser.me/api/portraits/men/5.jpg", "https://randomuser.me/api/portraits/men/48.jpg", "https://randomuser.me/api/portraits/men/11.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg", "https://randomuser.me/api/portraits/men/undefined.jpg"]

# Array of last names

last_names = ['Abbott',
 'Acevedo',
 'Acosta',
 'Adams',
 'Adkins',
 'Aguilar',
 'Aguirre',
 'Albert',
 'Alexander',
 'Alford',
 'Allen',
 'Allison',
 'Alston',
 'Alvarado',
 'Alvarez',
 'Anderson',
 'Andrews',
 'Anthony',
 'Armstrong',
 'Arnold',
 'Ashley',
 'Atkins',
 'Atkinson',
 'Austin',
 'Avery',
 'Avila',
 'Ayala',
 'Ayers',
 'Bailey',
 'Baird',
 'Baker',
 'Baldwin',
 'Ball',
 'Ballard',
 'Banks',
 'Barber',
 'Barker',
 'Barlow',
 'Barnes',
 'Barnett',
 'Barr',
 'Barrera',
 'Barrett',
 'Barron',
 'Barry',
 'Bartlett',
 'Barton',
 'Bass',
 'Bates',
 'Battle',
 'Bauer',
 'Baxter',
 'Beach',
 'Bean',
 'Beard',
 'Beasley',
 'Beck',
 'Becker',
 'Bell',
 'Bender',
 'Campbell',
 'Campos',
 'Cannon',
 'Cantrell',
 'Cantu',
 'Cardenas',
 'Carey',
 'Carlson',
 'Carney',
 'Carpenter',
 'Carr',
 'Carrillo',
 'Carroll',
 'Carson',
 'Carter',
 'Carver',
 'Case',
 'Casey',
 'Cash',
 'Castaneda',
 'Castillo',
 'Castro',
 'Cervantes',
 'Chambers',
 'Chan',
 'Chandler',
 'Chaney',
 'Chang',
 'Chapman',
 'Charles',
 'Chase',
 'Chavez',
 'Chen',
 'Cherry',
 'Christensen',
 'Christian',
 'Church',
 'Clark',
 'Clarke',
 'Clay',
 'Clayton',
 'Clements',
 'Clemons',
 'Cleveland',
 'Cline',
 'Cobb',
 'Cochran',
 'Coffey',
 'Cohen',
 'Cole',
 'Coleman',
 'Collier',
 'Collins',
 'Colon',
 'Combs',
 'Compton',
 'Conley',
 'Conner',
 'Conrad',
 'Contreras',
 'Conway',
 'Cook',
 'Cooke',
 'Cooley',
 'Cooper',
 'Copeland',
 'Cortez',
 'Cote',
 'Cotton',
 'Cox',
 'Craft',
 'Craig',
 'Crane',
 'Crawford',
 'Crosby',
 'Cross',
 'Cruz',
 'Cummings',
 'Cunningham',
 'Curry',
 'Curtis',
 'Dale',
 'Dalton',
 'Daniel',
 'Daniels',
 'Daugherty',
 'Davenport',
 'David',
 'Davidson',
 'Davis',
 'Dawson',
 'Day',
 'Dean',
 'Decker',
 'Dejesus',
 'Delacruz',
 'Delaney',
 'Deleon',
 'Delgado',
 'Dennis',
 'Diaz',
 'Dickerson',
 'Dickson',
 'Dillard',
 'Dillon',
 'Dixon',
 'Dodson',
 'Dominguez',
 'Donaldson',
 'Donovan',
 'Dorsey',
 'Dotson',
 'Douglas',
 'Downs',
 'Doyle',
 'Drake',
 'Dudley',
 'Duffy',
 'Duke',
 'Duncan',
 'Dunlap',
 'Dunn',
 'Duran',
 'Durham',
 'Dyer',
 'Eaton',
 'Edwards',
 'Elliott',
 'Ellis',
 'Ellison',
 'Emerson',
 'England',
 'English',
 'Erickson',
 'Espinoza',
 'Estes',
 'Estrada',
 'Evans',
 'Everett',
 'Ewing',
 'Farley',
 'Farmer',
 'Farrell',
 'Faulkner',
 'Ferguson',
 'Fernandez',
 'Ferrell',
 'Fields',
 'Figueroa',
 'Finch',
 'Finley',
 'Fischer',
 'Fisher',
 'Fitzgerald',
 'Fitzpatrick',
 'Fleming',
 'Fletcher',
 'Flores',
 'Flowers',
 'Floyd',
 'Flynn',
 'Foley',
 'Forbes',
 'Ford',
 'Foreman',
 'Foster',
 'Fowler',
 'Fox',
 'Francis',
 'Franco',
 'Frank',
 'Franklin',
 'Franks',
 'Frazier',
 'Frederick',
 'Freeman',
 'French',
 'Frost',
 'Fry',
 'Frye',
 'Fuentes',
 'Fuller',
 'Fulton',
 'Harding',
 'Hardy',
 'Harmon',
 'Harper',
 'Harrell',
 'Harrington',
 'Harris']

# Fin array of last names

# Array of first_names

first_names_man = %w[ Antoine Martin Nad Gaetan Margaux François Xavier Ambroise Dan Daniel Simon Yvon Yves Jacques Basile Pierre Augustin Paul Louis Jeremy Nicolas Maxence Max Edwin Marc Marco Remi Vincent Jerome Tom Thomas ]

first_names_woman = %w[ Sybille Pauline Amandine Jeanne Lea Caroline Laure Clara Anna Mila Rose Lina Ambre Manon Camille Lola Juliette Agathe Eva Lucie Nina]
# Fin Array of first_names



# TODO : change computation here so that we use the scores hash

def student_trains_on_flashcards(student, material)
  material.chapters.each do |chapter|
    session = Session.create!(user_id:    student.id,
                              chapter_id: chapter.id,)

    chapter.flashcards.each do |flashcard|
      if UserAnswer.count <= 8500

        user_answer = UserAnswer.create!(session_id:   session.id,
                           flashcard_id: flashcard.id,
                           output:       [true, false].sample,
                           )
        until user_answer.output
          user_answer = UserAnswer.create!(session_id:   session.id,
                             flashcard_id: flashcard.id,
                             output:       [true, false].sample,
                             )
        end
      end
    end
    student.scores[chapter.id] = session.score / session.flashcards.length * 100
    puts "Updated score hash for #{student.full_name} : #{student.scores}"
  end
  student.save!
end

# def student_leaves_a_review(student, course)

# end

puts "=============== Destroying feedback ==============="
Feedback.destroy_all
puts Feedback.all.size
puts "=============== Destroying user ==============="
User.destroy_all
puts User.all.size
puts "=============== Destroying session ==============="
Session.destroy_all
puts Session.all.size
puts "=============== Destroying notification ==============="
Notification.destroy_all
puts Notification.all.size
puts "=============== Destroying message ==============="
Message.destroy_all
puts Message.all.size
puts "=============== Destroying forum ==============="
Forum.destroy_all
puts Forum.all.size
puts "=============== Destroying course ==============="
Course.destroy_all
puts Course.all.size
puts "=============== Destroying division ==============="
Division.destroy_all
puts Division.all.size
puts "=============== Destroying chapter ==============="
Chapter.destroy_all
puts Chapter.all.size
puts "=============== Destroying material ==============="
Material.destroy_all
puts Material.all.size
puts "=============== Destroying flashcard ==============="
Flashcard.destroy_all
puts Flashcard.all.size
puts "=============== Destroying user_answers ==============="
UserAnswer.destroy_all
puts UserAnswer.all.size

puts "Creating teachers"

teacher1 = User.create!(
  email:        "antoine.piguet@gmail.com",
  first_name:   "Antoine",
  last_name:    "Piguet",
  password:     "azerty",
  role:         "teacher",
  picture_url:  "https://avatars1.githubusercontent.com/u/48388543?s=460&v=4"
)

teacher2 = User.create!(
  email:        "diogo.heinen@gmail.com",
  first_name:   "Diogo",
  last_name:    "Heinen",
  password:     "azerty",
  role:         "teacher",
  picture_url:  "https://avatars3.githubusercontent.com/u/18058374?s=400&v=4"
)

puts "Creating 4 different divisions, each containing 40 students"

user_emails = []

div1 = Division.create!(
         name:  "Term. S2",
         level: "Terminale"
         )
# ---------------------------------------- Seed students div 1 ---------------------------------------

first_stud = User.new( first_name: "Margaux",
                        last_name: "Roger",
                        email: "margaux.roger@gmail.com",
                        password: "azerty",
                        division_id: div1.id,
                        )
first_stud.picture_url = woman_urls[rand(0...man_urls.length)]
first_stud.save!
user_emails << first_stud.email

20.times do
  student_first_name = first_names_man.sample
  student_last_name = last_names.sample
  student_email = "#{student_first_name}.#{student_last_name}@gmail.com"
  unless user_emails.include?(student_email)
    user_instance = User.new( first_name:  student_first_name,
                              last_name:   student_last_name,
                              email:       student_email,
                              password:    'azerty',
                              division_id: div1.id,
                            )

    user_instance.picture_url = man_urls[rand(0...man_urls.length)]
    user_instance.save!
    user_emails << student_email
  end
end

19.times do
  student_first_name = first_names_woman.sample
  student_last_name = last_names.sample
  student_email = "#{student_first_name}.#{student_last_name}@gmail.com"
  unless user_emails.include?(student_email)
    user_instance = User.new( first_name:  student_first_name,
                              last_name:   student_last_name,
                              email:       student_email,
                              password:    'azerty',
                              division_id: div1.id,
                            )

    user_instance.picture_url = woman_urls[rand(0...woman_urls.length)]
    user_instance.save!
    user_emails << student_email
  end
end

# --------------------------------------Fin Seed students -------------------------------------

div2 = Division.create!(
         name:  "Prem. ES3",
         level: "Terminale"
         )
# ---------------------------------------- Seed students div 2 ---------------------------------------

20.times do
  student_first_name = first_names_man.sample
  student_last_name = last_names.sample
  student_email = "#{student_first_name}.#{student_last_name}@gmail.com"
  unless user_emails.include?(student_email)
    user_instance = User.new( first_name:  student_first_name,
                              last_name:   student_last_name,
                              email:       student_email,
                              password:    'azerty',
                              division_id: div2.id,
                            )

    user_instance.picture_url = man_urls[rand(0...man_urls.length)]
    user_instance.save!
    user_emails << student_email
  end
end

20.times do
  student_first_name = first_names_woman.sample
  student_last_name = last_names.sample
  student_email = "#{student_first_name}.#{student_last_name}@gmail.com"
  unless user_emails.include?(student_email)
    user_instance = User.new( first_name:  student_first_name,
                              last_name:   student_last_name,
                              email:       student_email,
                              password:    'azerty',
                              division_id: div2.id,
                            )

    user_instance.picture_url = woman_urls[rand(0...woman_urls.length)]
    user_instance.save!
    user_emails << student_email
  end
end

# --------------------------------------Fin Seed students -------------------------------------


div3 = Division.create!(
         name:  "Term. L1",
         level: "Terminale"
         )
# ---------------------------------------- Seed students div 3 ---------------------------------------

20.times do
  student_first_name = first_names_man.sample
  student_last_name = last_names.sample
  student_email = "#{student_first_name}.#{student_last_name}@gmail.com"
  unless user_emails.include?(student_email)
    user_instance = User.new( first_name:  student_first_name,
                              last_name:   student_last_name,
                              email:       student_email,
                              password:    'azerty',
                              division_id: div3.id,
                            )

    user_instance.picture_url = man_urls[rand(0...man_urls.length)]
    user_instance.save!
    user_emails << student_email
  end
end

20.times do
  student_first_name = first_names_woman.sample
  student_last_name = last_names.sample
  student_email = "#{student_first_name}.#{student_last_name}@gmail.com"
  unless user_emails.include?(student_email)
    user_instance = User.new( first_name:  student_first_name,
                              last_name:   student_last_name,
                              email:       student_email,
                              password:    'azerty',
                              division_id: div3.id,
                            )

    user_instance.picture_url = woman_urls[rand(0...woman_urls.length)]
    user_instance.save!
    user_emails << student_email
  end
end

# --------------------------------------Fin Seed students -------------------------------------


div4 = Division.create!(
         name:  "Sec. 1",
         level: "Terminale"
         )
# ---------------------------------------- Seed students div 4 ---------------------------------------

20.times do
  student_first_name = first_names_man.sample
  student_last_name = last_names.sample
  student_email = "#{student_first_name}.#{student_last_name}@gmail.com"
  unless user_emails.include?(student_email)
    user_instance = User.new( first_name:  student_first_name,
                              last_name:   student_last_name,
                              email:       student_email,
                              password:    'azerty',
                              division_id: div4.id,
                            )

    user_instance.picture_url = man_urls[rand(0...man_urls.length)]
    user_instance.save!
    user_emails << student_email
  end
end

20.times do
  student_first_name = first_names_woman.sample
  student_last_name = last_names.sample
  student_email = "#{student_first_name}.#{student_last_name}@gmail.com"
  unless user_emails.include?(student_email)
    user_instance = User.new( first_name:  student_first_name,
                              last_name:   student_last_name,
                              email:       student_email,
                              password:    'azerty',
                              division_id: div4.id,
                            )

    user_instance.picture_url = woman_urls[rand(0...woman_urls.length)]
    user_instance.save!
    user_emails << student_email
  end
end

# --------------------------------------Fin Seed students -------------------------------------


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
                          image: "gouvernance",
                          chapter_id: hist_term_s_chap1.id,
                        )

hist_term_s_chap1_fc2 = Flashcard.create!(
                          question: "Quand et où le premier système de gouvernance économique a-t-il été mis en place?",
                          answer:   "Le premier système de gouvernance économique
    mondiale est mis en place en 1944, à la conférence de Bretton Woods.",
                          image: "first-gouvernance",
                          chapter_id: hist_term_s_chap1.id,
                        )

hist_term_s_chap1_fc3 = Flashcard.create!(
                          question: "Comment les US ont-ils financé la guerre du Vietnam et la Course à l'Espace ?",
                          answer:   "les Etats-Unis, pour financer la guerre du Vietnam
    et la course à l’espace, ont épuisé leurs stocks d’or et ont émis des grandes quantités de dollars : le dollar perd
    donc une grande part de sa valeur du fait de l’indexation du dollar sur l’or, et les prix augmentent partout dans
    le monde puisque les autres monnaies sont indexées sur le dollar.",
                          image: "course-espace",
                          chapter_id: hist_term_s_chap1.id,
                        )

hist_term_s_chap1_fc4 = Flashcard.create!(
                          question: "Le libre-échange est-il en progrès ou en contraction dans les années 2010?",
                          answer:   "Dans les années 2010,
    l’OMC peine à faire progresser le libre-échange, car dans un contexte de crise, les états se replient sur leurs
    propres intérêts, de plus en plus divergents.",
                          image: "libre-echange",
                          chapter_id: hist_term_s_chap1.id,
                        )

hist_term_s_chap1_fc5 = Flashcard.create!(
                          question: "Citez un acteur de la société civile qui dénonce la mondialisation",
                          answer:   "Des acteurs nouveaux s’imposent et dénoncent les
    dérives de la mondialisation, qu’ils voient comme les conséquences de la gouvernance économique libérale. Ce
    sont les ONG, émanations de la société civile, comme ATTAC, fondée en France en 1998 pour obtenir une
    taxation sur les transactions financières dont le produit irait au développement des pays du Sud.",
                          image: "mondialisation",
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


# --------------------------------- Chap 3 ---------------------------------------------

hist_term_s_chap3 = Chapter.create!(
  name:    "Stratégie et course à l'armement",
  content: "Sur le plan stratégique, le Grand État-Major général allemand élabore chaque année un nouveau plan de mobilisation.
  À partir de 1905, les plans prévoient de déployer la quasi-totalité des forces armées allemandes face à l'armée française29,
  dans l'espoir d'être rapidement victorieux contre elle : étant donné les fortifications françaises le long de la frontière commune,
  la victoire décisive doit être obtenue par une vaste manœuvre d'enveloppement par le nord,
  en passant par le territoire du Luxembourg et de la Belgique, malgré la neutralité de ces deux États (garantie par des traités internationaux).
  En 1914, le plan à appliquer prévoit de laisser face à la Russie une faible partie des forces allemandesd, en pariant sur la lenteur de la mobilisation russe ;
  ce plan oblige cependant l’Allemagne à prendre l’initiative des opérations militaires,
  dans le cas où la France entrerait en guerre immédiatement après la Russie.

De son côté, la France met sur pied à partir de 1913 le plan XVII31 qui, respectant la neutralité belge,
prévoit de répondre à une attaque allemande en prenant l'offensive en Lorraine sur un terrain moins favorable que les plaines de Flandre.
Enfin les Britanniques, sous l'impulsion de Henry Hughes Wilson, directeur des opérations militaires au ministère de la Guerre,
 adoptent un plan de débarquement du Corps expéditionnaire britannique en France en cas d'attaque allemande.
 L'état-major de la Royal Navy s'oppose à ce projet qui serait trop long à mettre en œuvre ;
 les Allemands seraient à mi-chemin de Paris avant que l'armée britannique puisse agir.
 En plus, les quatre à six divisions que les Britanniques seraient susceptibles de mettre sur pied auraient peu de poids dans une guerre où chaque camp alignait entre 70 et 80 divisions.
 Une autre option envisagée par l’état-major britannique est de débarquer à Anvers en cas d'une menace de l'Armée allemande sur ce port bien abrité dans l'estuaire de l'Escaut,
 à partir duquel la puissante marine de guerre bâtie par l'empereur Guillaume II pourrait menacer les communications de l'Angleterre dans la Manche.

Dans les deux camps, la course aux armements s’accélère et il y a surenchère dans la préparation de la guerre.
Les dépenses consacrées aux armées s’envolent. Les fortifications frontalières (du moins à la fin du xixe siècle),
l’artillerie (le fameux canon de 75 de l’armée française),
les canons lourds allemands et les flottes de guerre (le Dreadnought britannique et les cuirassés allemands) absorbent une bonne partie des budgets des États.
Le matériel est modernisé et la durée du service militaire allongée dans plusieurs pays : en France,
la durée du service militaire passe à trois ans en août 191332 pour pallier (dans une certaine mesure) l’infériorité numérique de la France face à l’Allemagne.
En effet, si, en 1870, les deux pays avaient une population quasi identique, en 1914 l’Allemagne comprenait une population de 67 millions33,
tandis que la France, ayant à peine comblé la perte de l’Alsace-Lorraine, était peuplée d'environ 40 millions d’habitants34.
En Belgique, une loi instaure le service militaire obligatoire et l'armement des forts de l'Est est accéléré,
mesures destinées à rendre crédible la volonté belge de défendre la neutralité du pays contre toute attaque,
comme le traité de 1831 garantissant l'indépendance, en fait obligation au royaume.
C'est la seule façon d'espérer que la France et le Royaume-Uni rempliront leur devoir de garants en venant au secours de la Belgique si celle-ci est envahie par l'Allemagne,
ce qui paraît la perspective la plus probable.",

  material_id: hist_term_s.id,
  )

hist_term_s_chap3_fc1 = Flashcard.create!(
                          question:   "D'où vient le nom de course à l'armement ?",
                          answer:     "Des médias et de la propagande de l'époque.",
                          chapter_id: hist_term_s_chap3.id,
                        )

hist_term_s_chap3_fc2 = Flashcard.create!(
                          question:   "A combien d'années passe le service militaire en France en 1913 ?",
                          answer:     "3 ans.",
                          chapter_id: hist_term_s_chap3.id,
                          )

hist_term_s_chap3_fc3 = Flashcard.create!(
                          question:   "Quel est la stratégie Allemande en 1905 ?",
                          answer:     "L'Allemagne veut déployer toutes les forces armées contre la France",
                          chapter_id: hist_term_s_chap3.id,
                        )

hist_term_s_chap3_fc4 = Flashcard.create!(
                          question: "Quelle est la date de l'attentat de Sarajevo le 28 juin 1914 ?",
                          answer: "Il faut toujours lire la question avant de se lancer dans la réponse. (28 juin 2914).",
                          chapter_id: hist_term_s_chap3.id,
                        )

hist_term_s_chap3_fc5 = Flashcard.create!(
                          question:   "Quelle est la date de déclaration de guerre de la France ?",
                          answer:     "3 novembre 1914.",
                          chapter_id: hist_term_s_chap3.id,
                          )

# -------------------------------- Fin Chap 3 ----------------------------------------

# ----------------------------- Chap 4 -------------------------------------------

hist_term_s_chap4 = Chapter.create!(
  name:    "Les Etats-Unis et le monde depuis 1945",
  content: "En janvier 2015, dans une interview donnée au média en ligne américain vox.com, le
président des Etats-Unis Barack Obama résumait ainsi le rôle que doit, selon-lui, occuper son pays
dans le monde, vision partagée par la majorité de ses concitoyens : « Nous sommes le pays […] le
plus puissant sur terre. Quand des problèmes surgissent, on n’appelle pas Pékin ni Moscou. On nous
appelle. Et nous assumons cette responsabilité ».

Jusqu’en 1941, au contraire de cette intervention de Barack Obama, les
Etats-Unis, jeune état d’Amérique, vaste et peuplé, issu de la colonisation européenne, fondaient
leur politique extérieur sur l’isolationnisme, depuis 1918. Ainsi, ils n’avaient pas intégré la « Société
des Nations », ancêtre de l’ONU, pourtant imaginée par un président américain, Woodrow Wilson.
Agressés par le Japon en décembre 1941, à Pearl Harbor, les Etats-Unis opèrent un tournant capital
et entrent dans la Seconde Guerre mondiale, ce qui inaugure leur interventionnisme. Les Etats-Unis
participent ainsi activement à l’après-guerre (création de l’ONU, dénazification, etc.). Ils paraissent
vouloir user pleinement de leur puissance dans toutes ses dimensions (par leur hard-power, leur
force militaire et économique, et leur soft-power, leur capacité d’influence), pour peser sur la scène
internationale et dicter la marche du monde. Ils ambitionnent ainsi de diffuser leur mode de vie et
leurs valeurs (libéralisme, droits de l’homme, démocratie). En 1945, à la fin de la Seconde Guerre
mondiale qu’ils remportent avec leurs alliés, les Etats-Unis font donc figure de superpuissance, ou
puissance globale. Mais ils doivent faire face à une autre l’URSS communiste, autre superpuissance,
dans le cadre de la Guerre froide, de 1947 à 1991. A la fin de celle-ci, les Etats-Unis s’imposent
comme l’unique superpuissance mondiale, rapidement contestée.

Comment la puissance états-unienne s’est-elle affirmée sur la scène
internationale, depuis la fin de la Seconde Guerre mondiale ? Comment a évolué la place que les
Etats-Unis ont joué dans le monde, depuis 1945 ?

Pour répondre à ces questions, nous adopterons un plan chronologique.
Après avoir montré que l’après-Seconde Guerre mondiale constitue un tournant dans la politique
étrangère américaine, nous verrons comme la Guerre froide a pesé sur la place occupée par les EtatsUnis dans le monde,
avant d’étudier les évolutions de sa politique étrangère depuis 1991.

La Seconde Guerre mondiale a renforcé la puissance
des Etats-Unis, et rompu son isolationnisme : fort de son hard power et de son soft power, le pays
s’est posé en champion d’un nouvel ordre mondial, permettant d’assurer la paix. Ce rôle a été
contesté par la concurrence de l’URSS, dans le cadre de la Guerre froide en fonction de laquelle a été
définie la politique étrangère américaine jusqu’à la fin des années 1980. En 1991, avec la disparition
du bloc communiste, la puissance des Etats-Unis apparait sans équivalent, ce qui leur permet de se
poser en « gendarmes du monde ». Mais la montée de nouvelles formes extrêmes de contestation
ainsi que l’émergence d’autres superpuissances ont contribué à fragiliser leur place dans le monde.",
  material_id: hist_term_s.id,
  )

hist_term_s_chap4_fc1 = Flashcard.create!(
                          question:   "Définir l'isolationnisme",
                          answer:     "L'isolationnisme est une doctrine de politique extérieure qui combine un non-interventionnisme militaire et une politique de patriotisme économique.",
                          chapter_id: hist_term_s_chap4.id,
                        )

hist_term_s_chap4_fc2 = Flashcard.create!(
                          question:   "Quel est le nom donné au conflit entre l'URSS et les Etats-Unis",
                          answer:     "Guerre Froide",
                          chapter_id: hist_term_s_chap4.id,
                          )

hist_term_s_chap4_fc3 = Flashcard.create!(
                          question:   "Quel est le surnom donné aux Etats-Unis",
                          answer:     "Gendarme des mondes",
                          chapter_id: hist_term_s_chap4.id,
                        )

# -------------------------------- Fin Chap 4 ----------------------------------------

# --------------------------------- Chap 5 --------------------------------------------

hist_term_s_chap5 = Chapter.create!(
  name:    "La Chine et le monde depuis 1949",
  content: "En 2017, en ouverture du congrès du Parti communiste chinois, le leader du pays, XI
Jinping, fixe comme objectif de « hisser la Chine au premier rang du monde » d’ici 2049, pour le
centenaire de la naissance de la République populaire de Chine. Cette ambition traduit
l’exceptionnelle montée en puissance du pays depuis le milieu du XXème siècle.

Pourtant, au début du XXème siècle, la Chine, ancienne très grande
puissance de l’Asie orientale (elle fut un Empire dès le IIIème siècle avant J.C.), est un état affaibli :
elle est soumise à l’impérialisme des grandes puissances occidentales. Ce n’est qu’en 1945 que la
Chine retrouve sa souveraineté : agressée par le Japon en 1937, le pays, allié des Etats-Unis et de
l’URSS, obtient alors un siège permanent au Conseil de sécurité de l’ONU et la fin de toute
domination étrangère. Cependant, le pays bascule immédiatement dans la guerre civile, opposant les
troupes nationalistes (prônant une imitation du modèle économique et social occidental) aux
troupes communistes dirigées par MAO Zedong, leader du Parti communiste chinois (PCC) voulant
transformer la société pour la rendre plus égalitaire, en confiant le pouvoir politique et économique
au prolétariat (ouvriers et paysans).L’année 1949, marquant le début de notre étude, correspond à la
victoire des communistes et à la naissance de la « République populaire de Chine » (RPC), le 1er
octobre. Ce nouvel état communiste, créé dans les premières années de la Guerre froide, n’est pas
reconnu par les puissances occidentales, qui soutiennent le gouvernement nationaliste en exil,
réfugié à Taïwan. La Chine de Mao, marquée par le sous-développement, s’aligne dans un premier
temps sur le modèle soviétique. Mais la rupture politique avec l’URSS dans les années 1950 et, plus
encore, la mort de Mao en 1976, conduisent la Chine à se convertir économiquement, passant du
communisme au capitalisme. Ce tournant a été décisif dans l’accès du pays à une position de premier
plan, devenant la deuxième puissance économique mondiale en 2010.

Comment a évolué la place de la Chine dans le monde depuis 1949 ? Quelles
ont été les causes des différentes réorientations de sa politique étrangère ?

Pour répondre à ces questions, nous adopterons un plan chronologique.
Après avoir montré que la victoire des communistes en 1949 a constitué un tournant dans la
politique étrangère chinoise, nous verrons comment la mort de Mao a permis à la Chine de s’affirmer
sur la scène internationale.

En 1949, suite à la victoire des forces communistes
lors de la Guerre civile, la Chine imite le modèle soviétique pour assurer son développement et
s’affirmer. Dès la fin des années 1950, Pékin rompt avec l’URSS et se retrouve temporairement isolée
sur la scène internationale, jusqu’à son rapprochement avec l’occident dans les années 1960-1970.
Mais le véritable tournant fut la mort de Mao et la politique d’ouverture économique menée par
DENG Xiaoping dans les années 1980, et poursuivie par ses successeurs : elle permis à la Chine de
s’intégrer à la mondialisation et de devenir une puissance économique mondiale de premier plan,
dont le rayonnement diplomatique et culturel demeure toutefois limité.

La Chine, gouvernée par le PCC mais capitaliste dans les faits, cultive un paradoxe :
le régime autoritaire chinois pourra-t-il se maintenir tout en développant l’ouverture du pays au
monde ?",
  material_id: hist_term_s.id,
  )

hist_term_s_chap5_fc1 = Flashcard.create!(
                          question:   "En quelle année la Chine obtient un siège à l'ONU ?",
                          answer:     "1945",
                          chapter_id: hist_term_s_chap5.id,
                        )

hist_term_s_chap5_fc2 = Flashcard.create!(
                          question:   "En quelle année meurt Mao ?",
                          answer:     "1976",
                          chapter_id: hist_term_s_chap5.id,
                          )

hist_term_s_chap5_fc3 = Flashcard.create!(
                          question:   "Quelle est la conséquence de la mort de Mao pour la Chine ?",
                          answer:     "La Chine s'ouvre au capitalisme.",
                          chapter_id: hist_term_s_chap5.id,
                        )

hist_term_s_chap5_fc4 = Flashcard.create!(
                          question:   "Quel est le paradoxe Chinois ?",
                          answer:     "La Chine est gouvernée par un régime communiste mais capitaliste sur le plan économique.",
                          chapter_id: hist_term_s_chap5.id,
                        )

# ------------------------------------ Fin du Chap 5 -----------------------------------

maths_term_s = Material.create!(
  name: "Maths for Term. S classes",
  category: "Maths"
  )

maths_term_s_chap1 = Chapter.create!(
  name: "Polynômes et équations du second degré",
  content: "On appelle polynôme (ou trinôme) du second degré toute expression pouvant se mettre sous la forme :
    On rappelle que les solutions de l'équation
    f(x)=0
     sont les abscisses des points d'intersection de la courbe
    C_{f}Cf
     et de l'axe des abscisses.
    En regroupant les propriétés de ce chapitre et celles vues en Seconde on peut résumer ces résultats dans le tableau :",
  material_id: maths_term_s.id,
  )

maths_term_s_chap1_fc1 = Flashcard.create!(
                          question:   "Quelle est la forme d'une équation du second degré ?",
                          answer:     "aX + bX^2 + c",
                          chapter_id: maths_term_s_chap1.id,
                        )

maths_term_s_chap1_fc2 = Flashcard.create!(
                          question: "Qu'est-ce que l'ordonnée à l'origine ?",
                          answer: "La valeur de la fonction pour x = 0",
                          chapter_id: maths_term_s_chap1.id,
                        )

maths_term_s_chap1_fc3 = Flashcard.create!(
                          question:   "Où est l'axe des abscisses?",
                          answer:     "En bas.",
                          chapter_id: maths_term_s_chap1.id,
                          )


maths_term_s_chap2 = Chapter.create!(
  name: "Etude de fonctions",
  content: "Une fonction associe, à tout nombre réel. Cette définition est importante car elle établit un lien entre la courbe représentative d'une fonction et la formule définissant la fonction. Elle permet de déterminer notamment si un point appartient à la courbe représentative d'une fonction.
    La fonction racine carrée est strictement croissante sur
    left[0;+infinity right[[0;+∞[",
  material_id: maths_term_s.id,
  )

maths_term_s_chap2_fc1 = Flashcard.create!(
                          question:   "La fonction racine carrée est-elle croissante ou décroissante pour tout réel positif ?",
                          answer:     "Elle est croissante",
                          chapter_id: maths_term_s_chap2.id,
                        )

maths_term_s_chap2_fc2 = Flashcard.create!(
                          question:   "Qu'est-ce qu'une fonction affine ?",
                          answer:     "Une fonction de la forme aX + b",
                          chapter_id: maths_term_s_chap2.id,
                        )

maths_term_s_chap2_fc3 = Flashcard.create!(
                          question:   "Comment savoir si un point donné appartient à la courbe représentative d'une fonction ?",
                          answer:     "On calcule l'image de l'abscisses par la fonction en question. Si ce résultat est égal à l'ordonnée du point, alors celui-ci appartient à la courbe représentative de la fonction.",
                          chapter_id: maths_term_s_chap2.id,
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
            division: div3,
            material: hist_term_s,
            user_id: teacher1.id)

course4 = Course.create!(
            division: div4,
            material: hist_term_s,
            user_id: teacher1.id)

course5 = Course.create!(
            division: div2,
            material: hist_term_s,
            user_id: teacher1.id)

course6 = Course.create!(
            division: div1,
            material: maths_term_s,
            user_id: teacher2.id)

forum1 = Forum.create!(
            topic: "Histoire TS1",
            course_id: course1.id)

forum2 = Forum.create!(
            topic: "Maths 1ES",
            course_id: course2.id)

forum3 = Forum.create!(
            topic: "Histoire TS1",
            course_id: course3.id)

forum4 = Forum.create!(
            topic: "Histoire TS1",
            course_id: course4.id)

forum5 = Forum.create!(
            topic: "Histoire TS1",
            course_id: course5.id)

message1 = Message.create!(
            user_id: User.third.id,
            content: "Bonjour, j'ai une question sur le 1er chapitre",
            forum_id: forum1.id)

puts "Hard-working students are doing their flashcards"

Division.all.each do |division|
  division.users.each do |student|
    division.courses.each do |course|
      student_trains_on_flashcards(student, course.material)
    end
  end
end

puts "Students are now leaving feedbacks to courses they followed"

# Division.all.each do |division|
#   division.courses do |course|
#     division.users.each do |student|
#       student_leaves_a_review(student, course)
#     end
#   end
# end


# User.where(role: "student").each do |student|
#   Course.where(division_id: student.division.id).each do |course|
#     Feedback.create!(comment: Faker::Lorem.paragraph(sentence_count: 2),
#                      course_id: course.id,
#                      rating: rand(1..5),
#                      sentiment_score: rand(1..100),
#                      user_id: student.id
#                      )
#   end
# end

def azure_api_launch
  endpoint = "https://sentimentanalysiscalculator.cognitiveservices.azure.com/"
  key      = ENV["COGNITIVE_SERVICE_KEY"]
  TextAnalyticsClient.new(endpoint, key)
end

def comment_to_azure_json(text)
  input = MultiLanguageInput.new
  input.id = '1'
  input.language = 'en'
  input.text = text
  inputDocuments =  MultiLanguageBatchInput.new
  inputDocuments.documents = [input]
  return inputDocuments
end

def AnalyzeSentiment(inputDocuments)
  result = @textAnalyticsClient.sentiment(
      multi_language_batch_input: inputDocuments
  )
  result.documents.first.score
end

feedback_comments = [{ rating:  5,
                       comment: "This course was really helpful. I like the methodology. I would recommend it."},
                     { rating:  4,
                       comment: "Very good course. Perhaps we need more exercises to train for the final exam this year."},
                     { rating:  5,
                       comment: "You helped me understand all the key concepts of this course and I thank you for that !"},
                     { rating:  5,
                       comment: "Great course !"},
                     { rating:  5,
                       comment: "This course is a good overview and I want to learn more!"},
                     { rating:  5,
                       comment: "You helped me understand all the key concepts of this course and I thank you for that !"},
                     { rating:  5,
                       comment: "That was an awesome course, thanks !"},
                     { rating:  5,
                       comment: "It was an amazing class and very helpful."},
                     { rating:  5,
                       comment: "You were able to explain in a very nice and simple way"},
                     { rating:  5,
                       comment: "No words, the course was perfect!"},
                     { rating:  4,
                       comment: "Overall teaching methods were nice but I did not understand the last chapter."},
                     { rating:  5,
                       comment: "I liked the possibility to clarify things with you on the forum."},
                     { rating:  4,
                       comment: "Super explanations understood a lot, but the course was going fast."},
                     { rating:  4,
                       comment: "Easy to understand the course .Really Too much homeworks in my view."},
                     { rating:  4,
                       comment: "I really liked the course even if it was not my favorite subject."},
                     { rating:  4,
                       comment: "Really like the use of flashcards in the class, would love more online content."},
                     { rating:  4,
                       comment: "Cristal clear explanations. But this subject is not for me."},
                     { rating:  4,
                       comment: "Thanks to flashcards the teacher was able to pinpoint my difficulties."},
                     { rating:  4,
                       comment: "The courses were really good even if the courses were a little late in the evening for me."},
                     { rating:  4,
                       comment: "Nice teacher and classmates, make the class easier to appreciate."},
                     { rating:  4,
                       comment: "I really liked the way it was taught even if it was not my favorite subject."},
                     { rating:  4,
                       comment: "Courses were not  so easy to understand but helpful classmates."},
                     { rating:  3,
                       comment: "Nothing much to say about the class."},
                     { rating:  3,
                       comment: "The forum was a good way to get helped from peers.  Did not like the course structure."},
                     { rating:  3,
                       comment: " even if the courses were a little too long and hard to follow I keep a nice souvenir of the course."},
                     { rating:  3,
                       comment: "Really nice explanations too bad there is only few classes."},
                     { rating:  3,
                       comment: "Difficult to keep focus sometimes. nevertheless the teacher was very good."},
                     { rating:  3,
                       comment: "Great course, nice explanation. Nevertheless the exam was difficult."},
                     { rating:  2,
                       comment: "The flashcards were super helpful. On the over side the final exam was difficult."},
                     { rating:  2,
                       comment: " I understood most of key concepts.But opening part needs to be redone."},
                     { rating:  2,
                       comment: "I really like the subject but not so much the teacher."},
                     { rating:  2,
                       comment: "Course a little boring sometimes. nevertheless the teacher was available for questions."},
                     { rating:  2,
                       comment: "Prepared me well for the final exam. But really difficult to cover all subjects."},
                     { rating:  1,
                       comment: "I did not like the course that much it is not my cup of tea."},
                     { rating:  1,
                       comment: "very stressful teacher and don't like the subject so much."},

                     ]

puts feedback_comments

def sentiment_score_with_rating(rating)
  sentiment_student_score = 0
  if rating >=4
    return sentiment_student_score = rand(0.7..1.0) * 100
  elsif rating >=3
    return sentiment_student_score = rand(0.5..0.7) * 100
  elsif rating >=2
    return sentiment_student_score = rand(0.3..0.5) * 100
  else
    return sentiment_student_score = rand(0.1..0.3) * 100
  end
end


Division.all.each do |division|
  division.users.each do |student|
    division.courses.each do |course|
      feedback_comment = feedback_comments.sample
      new_feedback = Feedback.new(comment:   feedback_comment[:comment],
                                  course_id: course.id,
                                  rating:    feedback_comment[:rating],
                                  user_id:   student.id,
                                  )
      new_feedback.sentiment_score = sentiment_score_with_rating(feedback_comment[:rating])
      new_feedback.save!
    end
  end
end
#new_feedback.sentiment_score = azure_api_launch.AnalyzeSentiment(comment_to_azure_json(feedback_comment[:comment]))

puts "Simulating notifications"


User.where(role: "teacher").each do |teacher|
  Course.where(user_id: teacher.id).each do |course|
    Notification::NOTIFICATION_TYPES[1..3].each do |notification_type|
      if notification_type == 'flashcards'
        content = 'It seems that this class has some issue with its flashcards'
      elsif notification_type == 'feeling'
        content = 'There are some news about the feeling of students about your class'
      elsif notification_type == 'message'
        content = 'You have new messages from this class'
      else content = 'New feedbacks have arrived'
      end
      Notification.create!(  user_id: teacher.id,
                           course_id: course.id,
                             content: content,
                          notif_type: notification_type,)
    end
  end
end
