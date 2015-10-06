# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
User.create(email: "renata@barnsmoque.pl", password: "questr12")

Season.destroy_all
description = "Przyjdź do Barn Smoque, powiedz, że chcesz pobić rekord, zamów Double Pulled Pork, a jeśli pobijesz dotychczasowego lidera - burger będzie gratis. Konkurs trwa od 5 października do 25 listopada. Jasiek Gąsiennica Curuś Pizdryk Farell dla najszybszego świniobijcy funduje:
		<br>WYUZDANIE I ROZPUSTA!!!!
		<br>ŚWINIA, PYRY I KAPUSTA
		<br>METR CHORIZO, BOCZKU BLACHA
		<br>I TEQUILI ZŁOTEJ FLACHA
		<br>a wszystko to bo Barna kocham....
		<br>nagroda za udział jakaś???
		<br>Każdy z uczestników bierze udział w konkursie na własne ryzyko i własną odpowiedzialność."
html_code = '<iframe width="560" height="315" src="https://www.youtube.com/embed/Wq-6TqupiZE" frameborder="0" allowfullscreen></iframe>'
Season.create(description: description, number: 1, html_code: html_code)

Attempt.destroy_all
Attempt.create(name: "Gall", surname: "Anonim", minute: 4, second: 0, hundredths_of_second: 11, season: Season.last);
Attempt.create(name: "Zbigniew", surname: "Mąciwoda", minute: 5, second: 1, hundredths_of_second: 11, season: Season.last);
Attempt.create(name: "Emil", surname: "Gnał", minute: 1, second: 2, hundredths_of_second: 11, season: Season.last);
Attempt.create(name: "Ksywka", minute: 1, season: Season.last);
Attempt.create(name: "Emil", surname: "Gnał", second: 59, hundredths_of_second: 11, season: Season.last);