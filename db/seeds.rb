# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Role.destroy_all
News.destroy_all
# Attempt.destroy_all
# Season.destroy_all

['zarejestrowany', 'zbanowany', 'pracownik', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

User.create(email: "renata@barnsmoque.pl", password: "questr12", role: Role.where(name: "admin").first, name: "Renata", surname: "Petryka")

News.create(title: "Otwarcie restauracji", date: "11-09-2015".to_date, description: "Witamy naszych sympatyków.\r\nTradycyjnie, bez Magdy G., bez spiny i fajerwerków, bez specjalnych wystrojów - uczciwe żarcie i tyle.\r\nKto ma chęć, od 11 września ul. Zgoda 5 - bo nie samym burgerem żyje człowiek", release_date: Time.now, user_id: User.last.id)
News.create(title: "Świniobicie", date: "6-10-2015".to_date, description: "Zapraszamy na Świniobicie do Barn Smoque w którym można wygrać smaczne nagrody. Więcej informacji znajdziesz na #link", link_name: "swiniobicie.barnsmoque.pl", link_for: "http://swiniobicie.barnsmoque.pl", release_date: Time.now, user_id: User.last.id)