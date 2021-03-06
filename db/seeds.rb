# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

User.destroy_all
Role.destroy_all
News.destroy_all
# Attempt.destroy_all
# Season.destroy_all


['zarejestrowany', 'zbanowany', 'pracownik', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

admin = User.create!(email: "a@a.com", password: "questr12", role: Role.where(name: "admin").first, name: "Rafał", surname: "Petryka")

News.create!(title: "Otwarcie restauracji", date: "11-09-2015".to_date, description: "Witamy naszych sympatyków.\r\nTradycyjnie, bez Magdy G., bez spiny i fajerwerków, bez specjalnych wystrojów - uczciwe żarcie i tyle.\r\nKto ma chęć, od 11 września ul. Zgoda 5 - bo nie samym burgerem żyje człowiek", release_date: Time.now, user_id: User.last.id)
News.create!(title: "Świniobicie", date: "6-10-2015".to_date, description: "Zapraszamy na Świniobicie do Barn Smoque w którym można wygrać smaczne nagrody. Więcej informacji znajdziesz na #link", link_name: "swiniobicie.barnsmoque.pl", link_for: "http://swiniobicie.barnsmoque.pl", release_date: Time.now, user_id: User.last.id)

MenuGroup.destroy_all
DrinkGroup.destroy_all
MenuItem.destroy_all
DrinkItem.destroy_all

MenuGroup.create!(name: "ŚNIADANIA (od poniedziałku do piątku w godzinach 9:00 - 12:00)", user: admin)
MenuGroup.create!(name: "JAK ZDOBYWANO DZIKI ZACHÓD (pierwsze danie)", user: admin)
MenuGroup.create!(name: "DWA OBLICZA ZEMSTY (sałaty)", user: admin)
MenuGroup.create!(name: "ZA GARŚĆ DOLARÓW (kanapki)", user: admin)
MenuGroup.create!(name: "PRAWDZIWE MĘSTWO (główne)", user: admin)
MenuGroup.create!(name: "WYJĘTY SPOD PRAWA (tortille)", user: admin)
MenuGroup.create!(name: "BEZ PRZEBACZENIA (deser)", user: admin)
MenuGroup.create!(name: "ZA DODATKOWY HAJS", user: admin)

MenuItem.create!(name: "NEW YORK BAGEL", description: "bajgiel, jajko sadzone, wędzony łosoś, serek philadelphia z ziołami, szpinak, ser, sos miodowo-musztardowy", price: "14", english_description: "", menu_group: MenuGroup.find_by_name("ŚNIADANIA (od poniedziałku do piątku w godzinach 9:00 - 12:00)"), user: admin)
MenuItem.create!(name: "TEXAS BREAKFAST", description: "2 jaja „chłopskie” sadzone, smażone ziemniaki, bekon, fasolka bbq, grillowane kiełbaski 2 szt, pomidor", price: "14", english_description: "", menu_group: MenuGroup.find_by_name("ŚNIADANIA (od poniedziałku do piątku w godzinach 9:00 - 12:00)"), user: admin)
MenuItem.create!(name: "JOE BUFFALO WINGS", description: "smażone skrzydełka (9 szt.) w sosie BBQ lub louisiana z marchewką, selerem, i sosem ranchero", price: "21", english_description: "fried wings (9 pcs.) in BBQ or Louisiana sauce with carrots, celery and ranchero sauce", menu_group: MenuGroup.find_by_name("JAK ZDOBYWANO DZIKI ZACHÓD (pierwsze danie)"), user: admin)
MenuItem.create!(name: "FUCK CRACK BACON", description: "bekon w cieście piwnym z syropem klonowym i salsą jalapeno BBQ", price: "22", english_description: "bacon in beer batter with maple syrup and jalapeno BBQ salsa", menu_group: MenuGroup.find_by_name("JAK ZDOBYWANO DZIKI ZACHÓD (pierwsze danie)"), user: admin)
MenuItem.create!(name: "CRAZY GAUCHO", description: "pieczony ser z salsą fresca i tortillami", price: "21", english_description: "baked cheese with salsa fresca and tortillas", menu_group: MenuGroup.find_by_name("JAK ZDOBYWANO DZIKI ZACHÓD (pierwsze danie)"), user: admin)
MenuItem.create!(name: "CHILLI CON CARNE", description: "zupa z wołowiny z guacamole, serem, salsą fresca, śmietaną i nachos", price: "19", english_description: "beef soup with guacamole, cheese, salsa fresca, sour cream and nachos", menu_group: MenuGroup.find_by_name("JAK ZDOBYWANO DZIKI ZACHÓD (pierwsze danie)"), user: admin)
MenuItem.create!(name: "ROCKEFELER MAC", description: "ciepłe kluchy z mostkiem wołowym, szpinakiem i serem", price: "24", english_description: "warm noodles and beef brisket, spinach and cheese", menu_group: MenuGroup.find_by_name("JAK ZDOBYWANO DZIKI ZACHÓD (pierwsze danie)"), user: admin)
MenuItem.create!(name: "IOWA STYLE BRISKET", description: "mostek wołowy bbq, placki z kukurydzy, ser monterey jack, sałata", price: "28", english_description: "bbq beef brisket, corn tortillas, monterey jack cheese, lettuce", menu_group: MenuGroup.find_by_name("JAK ZDOBYWANO DZIKI ZACHÓD (pierwsze danie)"), user: admin)
MenuItem.create!(name: "MIESZANE SAŁATY Z GRILLOWANYMI POLĘDWICZKAMI WIEPRZOWYMI, NACHOS, SEREM PLEŚNIOWYM, WARZYWAMI I VINEGRET", description: "", price: "24", english_description: "mixed salads with grilled pork tenderloin, nachos, blue cheese, vegetables and vinaigrette", menu_group: MenuGroup.find_by_name("DWA OBLICZA ZEMSTY (sałaty)"), user: admin)
MenuItem.create!(name: "GRILLOWANE WARZYWA Z TOFU MARYNOWANE W CHIMICHURRI", description: "", price: "22", english_description: "grilled vegetables with tofu marinated in chimichurri", menu_group: MenuGroup.find_by_name("DWA OBLICZA ZEMSTY (sałaty)"), user: admin)
MenuItem.create!(name: "THE END", description: "burger 200g (charolaise), masło orzechowe, podwójny bekon, fryty, ketchup, salsa jalapeno - ananas - bbq", price: "26", english_description: "burger 200g (charolaise), peanut butter, double bacon, fries, ketchup, pineapple - jalapeno - bbq salsa", menu_group: MenuGroup.find_by_name("ZA GARŚĆ DOLARÓW (kanapki)"), user: admin)
MenuItem.create!(name: "TRAVIS", description: "burger 200g (charolaise), jalapeno, habanero, jolokia, ancho, chipotle chili, ser, bekon,  fryty, śmietana, bbq", price: "26", english_description: "burger 200g (charolaise), jalapeno, habanero, jolokia, ancho, chipotle chili, cheese, bacon, fries, sour cream, bbq", menu_group: MenuGroup.find_by_name("ZA GARŚĆ DOLARÓW (kanapki)"), user: admin)
MenuItem.create!(name: "PULLED PORK", description: "dłuuuuugo pieczona wieprzowina bbq 200g, ser, colesław, fasola z bekonem, fryty", price: "26", english_description: "looong roast pork bbq 200g, cheese, coleslaw, beans with bacon, fries", menu_group: MenuGroup.find_by_name("ZA GARŚĆ DOLARÓW (kanapki)"), user: admin)
MenuItem.create!(name: "PACANOVA", description: "burger 200g, (charolaise), ser, ser kozi, pieczarki, bekon, rukola, fryty, salsa, bbq", price: "26", english_description: "burger 200g (charolaise), cheese, goat cheese, mushrooms, bacon, rocket salad, fries, salsa bbq", menu_group: MenuGroup.find_by_name("ZA GARŚĆ DOLARÓW (kanapki)"), user: admin)
MenuItem.create!(name: "SUNSET VIEW", description: "steak z rostbefu 200q, szpinak, jajo sadzone, fasolka, bekon, sos bearnaise, fryty", price: "28", english_description: "rostbef steak, spinach, beans, bacon, fried egg, bearnaise sauce, fries", menu_group: MenuGroup.find_by_name("ZA GARŚĆ DOLARÓW (kanapki)"), user: admin)
MenuItem.create!(name: "ZEB MC CAIN", description: "żeberka bbq 400g z pieczonym ziemniakiem, fasolą z bekonem i sałatką colesław", price: "39", english_description: "bbq ribs 400g with baked potato, beans with bacon and coleslaw", menu_group: MenuGroup.find_by_name("PRAWDZIWE MĘSTWO (główne)"), user: admin)
MenuItem.create!(name: "JAMBALAYA", description: "kreolska potrawa z ryżu z kurczakiem, krewetkami, chorizo, warzywami, serwowana na patelni (śmiało dla dwóch osób)", price: "45", english_description: "creoles dish of rice with chicken, shrimp, chorizo, vegetables, served in a pan (serving for two people)", menu_group: MenuGroup.find_by_name("PRAWDZIWE MĘSTWO (główne)"), user: admin)
MenuItem.create!(name: "RIB EYE", description: "steak z antrykotu 350g (hereford), ziemniaki zapiekane z kozim serem i cebulką, masło anchovies, sałatka fit", price: "49", english_description: "entrecote steak 350g (hereford), potatoes baked with goat cheese and onion, anchovies butter, fit salad", menu_group: MenuGroup.find_by_name("PRAWDZIWE MĘSTWO (główne)"), user: admin)
MenuItem.create!(name: "NEW YORK", description: "steak z rostbefu 350g (hereford), groszek z pieczoną cebulką, truflowe frytki, sos Jack Daniels", price: "49", english_description: "rostbef steak 350g (hereford), peas with roasted onion, truffle fries, Jack Daniels sauce", menu_group: MenuGroup.find_by_name("PRAWDZIWE MĘSTWO (główne)"), user: admin)
MenuItem.create!(name: "CHINA TOWN", description: "polędwiczka wieprzowa bbq 350g z zasmażanym ryżem z woka i sosem jalapeno - ananas - bbq", price: "36", english_description: "pork tanderloin bbq 350g with wok fried rice with pineapple - jalapeno - bbq sauce", menu_group: MenuGroup.find_by_name("PRAWDZIWE MĘSTWO (główne)"), user: admin)
MenuItem.create!(name: "C MON BABY", description: "policzki wieprzowe bbq 300g z puree czosnkowym, sosem gravy z czarną porzeczką i brokułami z chilli", price: "34", english_description: "pork cheeks with garlic puree, gravy sauce with black currant and broccoli with chilli", menu_group: MenuGroup.find_by_name("PRAWDZIWE MĘSTWO (główne)"), user: admin)
MenuItem.create!(name: "GRINGO IN LONDON", description: "dorsz w panierce 250g, fryty, sos tatarski", price: "29", english_description: "breaded cod with essex, fries, tatar sauce", menu_group: MenuGroup.find_by_name("PRAWDZIWE MĘSTWO (główne)"), user: admin)
MenuItem.create!(name: "RANCHERO BURRITO", description: "tortilla z wołowiną (charolaise) 300g, fasolą, kukurydzą, guacamole, salsą fresca, jalapeno, śmietaną i nachos", price: "29", english_description: "tortilla with beef (charolaise) 300g, beans, corn, guacamole, salsa fresca, jalapeno, sour cream and nachos", menu_group: MenuGroup.find_by_name("WYJĘTY SPOD PRAWA (tortille)"), user: admin)
MenuItem.create!(name: "QUESA CON QUESO", description: "quesadillas z czterema serami ( mozarella, cheddar, mimolette, minnesota blue), rukolą i salsą fresca", price: "22", english_description: "quesadillas with four cheeses ( mozarella, cheddar, mimolette, minnesota blue) rocket salad and salsa fresca", menu_group: MenuGroup.find_by_name("WYJĘTY SPOD PRAWA (tortille)"), user: admin)
MenuItem.create!(name: "BIG BIRD", description: "tortilla z kurczakiem, fasolą, kukurydzą, serem, ananasem, curry mayo", price: "26", english_description: "tortilla with chicken, beans, corn, cheese, pineapple, curry mayo", menu_group: MenuGroup.find_by_name("WYJĘTY SPOD PRAWA (tortille)"), user: admin)
MenuItem.create!(name: "DEATH KISS", description: "brownies bez mąki, sorbet pomarańczowy, creme fraiche", price: "18", english_description: "brownies without flour, orange sorbet, creme fraiche", menu_group: MenuGroup.find_by_name("BEZ PRZEBACZENIA (deser)"), user: admin)
MenuItem.create!(name: "PLUM COBBLER", description: "śliwki z wanilią zapiekane pod kruszonką, lody cynamonowe z whisky", price: "16", english_description: "plums with vanilla baked in bread crumbs, cinnamon ice cream with whisky", menu_group: MenuGroup.find_by_name("BEZ PRZEBACZENIA (deser)"), user: admin)
MenuItem.create!(name: "FRYTY", english_name: "FRIES", description: "", price: "5", english_description: "", menu_group: MenuGroup.find_by_name("ZA DODATKOWY HAJS"))
MenuItem.create!(name: "NACHOS", description: "", price: "5", english_description: "", menu_group: MenuGroup.find_by_name("ZA DODATKOWY HAJS"))
MenuItem.create!(name: "I INNE", english_name: "OTHERS", description: "", price: "3", english_description: "", menu_group: MenuGroup.find_by_name("ZA DODATKOWY HAJS"))

DrinkGroup.create!(name: "EL DORADO", user: admin)
DrinkGroup.create!(name: "GARŚĆ DYNAMITU", user: admin)
DrinkGroup.create!(name: "DOBRY, ZŁY, BRZYDKI", user: admin)
DrinkGroup.create!(name: "POJEDYNEK W CORRALU O.K.", user: admin)
DrinkGroup.create!(name: "NAPAD NA EXPRESS", user: admin)

DrinkGroup.create!(name: "TEQUILA 40ml", drink_group: DrinkGroup.find_by_name("GARŚĆ DYNAMITU"), user: admin)
DrinkGroup.create!(name: "WHISKY/WHISKEY 40ml", drink_group: DrinkGroup.find_by_name("GARŚĆ DYNAMITU"), user: admin)
DrinkGroup.create!(name: "RUM 40ml", drink_group: DrinkGroup.find_by_name("GARŚĆ DYNAMITU"), user: admin)
DrinkGroup.create!(name: "GIN 40ml", drink_group: DrinkGroup.find_by_name("GARŚĆ DYNAMITU"), user: admin)
DrinkGroup.create!(name: "WÓDKA 40ml", english_name: "VODKA 40ml", drink_group: DrinkGroup.find_by_name("GARŚĆ DYNAMITU"), user: admin)
DrinkGroup.create!(name: "WINO DOMOWE", drink_group: DrinkGroup.find_by_name("GARŚĆ DYNAMITU"), user: admin)

DrinkItem.create!(name: "Piwo z beczki 0,5l", english_name: "Draft beer 0,5l", description: "", price: "", english_description: "", drink_group: DrinkGroup.find_by_name("EL DORADO"), user: admin)
DrinkItem.create!(name: "Raciborskie 0,5l", english_name: "", description: "", price: "9", english_description: "", drink_group: DrinkGroup.find_by_name("EL DORADO"), user: admin)
DrinkItem.create!(name: "Pszeniczniak 0,5l", english_name: "", description: "", price: "9", english_description: "", drink_group: DrinkGroup.find_by_name("EL DORADO"), user: admin)
DrinkItem.create!(name: "Johannes 0,5l", english_name: "", description: "", price: "9", english_description: "", drink_group: DrinkGroup.find_by_name("EL DORADO"), user: admin)
DrinkItem.create!(name: "Koźlak 0,5l", english_name: "", description: "", price: "9", english_description: "", drink_group: DrinkGroup.find_by_name("EL DORADO"), user: admin)
DrinkItem.create!(name: "Corona 0,33l", english_name: "", description: "", price: "12", english_description: "", drink_group: DrinkGroup.find_by_name("EL DORADO"), user: admin)
DrinkItem.create!(name: "Piwa rzemieślnicze", english_name: "Craft beer", description: "", price: "12", english_description: "", drink_group: DrinkGroup.find_by_name("EL DORADO"), user: admin)
DrinkItem.create!(name: "OLMECA SILVER", english_name: "", description: "", price: "15", english_description: "", drink_group: DrinkGroup.find_by_name("TEQUILA 40ml"), user: admin)
DrinkItem.create!(name: "OLMECA GOLD", english_name: "", description: "", price: "15", english_description: "", drink_group: DrinkGroup.find_by_name("TEQUILA 40ml"), user: admin)
DrinkItem.create!(name: "JACK DANIELS", english_name: "", description: "", price: "15", english_description: "", drink_group: DrinkGroup.find_by_name("WHISKY/WHISKEY 40ml"), user: admin)
DrinkItem.create!(name: "BURBON FOUR ROSES", english_name: "", description: "", price: "14", english_description: "", drink_group: DrinkGroup.find_by_name("WHISKY/WHISKEY 40ml"), user: admin)
DrinkItem.create!(name: "JAMESON", english_name: "", description: "", price: "13", english_description: "", drink_group: DrinkGroup.find_by_name("WHISKY/WHISKEY 40ml"), user: admin)
DrinkItem.create!(name: "FAMOUS GROUSE", english_name: "", description: "", price: "14", english_description: "", drink_group: DrinkGroup.find_by_name("WHISKY/WHISKEY 40ml"), user: admin)
DrinkItem.create!(name: "HAVANA CLUB", english_name: "", description: "", price: "12", english_description: "", drink_group: DrinkGroup.find_by_name("RUM 40ml"), user: admin)
DrinkItem.create!(name: "BACARDI LIGHT", english_name: "", description: "", price: "13", english_description: "", drink_group: DrinkGroup.find_by_name("RUM 40ml"), user: admin)
DrinkItem.create!(name: "BACARDI BLACK", english_name: "", description: "", price: "13", english_description: "", drink_group: DrinkGroup.find_by_name("RUM 40ml"), user: admin)
DrinkItem.create!(name: "GIN GORDONS", english_name: "", description: "", price: "13", english_description: "", drink_group: DrinkGroup.find_by_name("GIN 40ml"), user: admin)
DrinkItem.create!(name: "ABSOLUT", english_name: "", description: "", price: "10", english_description: "", drink_group: DrinkGroup.find_by_name("WÓDKA 40ml"), user: admin)
DrinkItem.create!(name: "WYBOROWA", english_name: "", description: "", price: "8", english_description: "", drink_group: DrinkGroup.find_by_name("WÓDKA 40ml"), user: admin)
DrinkItem.create!(name: "CZERWONE 12.5cl / 50cl", english_name: "RED 12.5cl / 50cl", description: "", price: "9/30", english_description: "", drink_group: DrinkGroup.find_by_name("WINO DOMOWE"), user: admin)
DrinkItem.create!(name: "BIAŁE 12.5cl / 50cl", english_name: "WHITE 12.5cl / 50cl", description: "", price: "9/30", english_description: "", drink_group: DrinkGroup.find_by_name("WINO DOMOWE"), user: admin)
DrinkItem.create!(name: "HERBATA", english_name: "TEA", description: "", price: "7", english_description: "", drink_group: DrinkGroup.find_by_name("NAPAD NA EXPRESS"), user: admin)
DrinkItem.create!(name: "ESPRESSO", english_name: "", description: "", price: "6", english_description: "", drink_group: DrinkGroup.find_by_name("NAPAD NA EXPRESS"), user: admin)
DrinkItem.create!(name: "ESPRESSO DOPPIO", english_name: "", description: "", price: "10", english_description: "", drink_group: DrinkGroup.find_by_name("NAPAD NA EXPRESS"), user: admin)
DrinkItem.create!(name: "LATTE", english_name: "", description: "", price: "9", english_description: "", drink_group: DrinkGroup.find_by_name("NAPAD NA EXPRESS"), user: admin)
DrinkItem.create!(name: "CAPPUCCINO", english_name: "", description: "", price: "8", english_description: "", drink_group: DrinkGroup.find_by_name("NAPAD NA EXPRESS"), user: admin)
DrinkItem.create!(name: "KAWA MROŻONA", english_name: "ICE COFFEE", description: "", price: "12", english_description: "", drink_group: DrinkGroup.find_by_name("NAPAD NA EXPRESS"), user: admin)
DrinkItem.create!(name: "MOJITO", english_name: "", description: "rum, mięta, woda gazowana, cukier trzcinowy, limonka", price: "19", english_description: "rum, mint, soda, sugar cane, lime", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "COSMOPOLITAN", english_name: "", description: "wódka, cointreau, sok z czarnej porzeczki, sok z limonki", price: "17", english_description: "vodka, cointreau, blackcurrant juice, lime juice", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "MARGARITA classic/truskawkowa", english_name: "MARGARITA classic/strawberry", description: "tequila, cointreau, sok z limonki/truskawki", price: "20", english_description: "tequila, cointreau, lime juice/strawberry juice", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "CUBA LIBRE", english_name: "", description: "rum, cola, sok z limonki", price: "18", english_description: "rum, cola, lime juice", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "TEQUILA SUNRISE", english_name: "", description: "tequila, sok pomarańczowy, grenadina", price: "20", english_description: "tequila, orange juice, grenadine", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "ADIOS MOTHER FUCKER", english_name: "", description: "wódka, tequila, rum, whisky, cointreau, sok z cytryny, syrop cukrowy, sprite", price: "29", english_description: "vodka, tequila, rum, whisky, cointreau, lime juice, sugar syrup, sprite", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "WHISKY SOUR", english_name: "", description: "whisky, sok z cytryny, syrop cukrowy", price: "16", english_description: "whisky, lemon juice, sugar syrup", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "1x SHOT MAD DOG", english_name: "", description: "wódka, syrop malinowy, tabasco", price: "9", english_description: "vodka, raspberry syrup, tabasco", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "1x SHOT KRZYWY RYJ", english_name: "", description: "wódka, syrop limonkowy, sour", price: "9", english_description: "vodka, lime syrup, sour", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "4x SHOT TROUBLEMAKER", english_name: "", description: "wódka, blue curacao, sour", price: "14", english_description: "vodka, blue curacao, sour", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "4x SHOT AMERICAN BEAUTY", english_name: "", description: "wódka, likier truskawkowy, sour", price: "14", english_description: "vodka, strawberry liqueur, sour", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "4x SHOT JUMANJI", english_name: "", description: "wódka, likier melonowy, sour, sweet", price: "14", english_description: "vodka, melon liqueur, sour, sweet", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "4x SHOT GOOD MORNING VIETNAM", english_name: "", description: "wódka, likier bananowy, sour, sweet", price: "14", english_description: "vodka, banana liqueur, sour, sweet", drink_group: DrinkGroup.find_by_name("DOBRY, ZŁY, BRZYDKI"), user: admin)
DrinkItem.create!(name: "COCA-COLA, COCA-COLA ZERO, FANTA 0,2l", english_name: "", description: "", price: "5", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "SPRITE, KINLEY TONIC 0,2l", english_name: "", description: "", price: "5", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "WODA KROPLA BESKIDU 0,25l", english_name: "WATER 'KROPLA BESKIDU' 0,25l", description: "gazowana/niegazowana", price: "5", english_description: "sparkling/still", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "NESTEA 0,25l", english_name: "", description: "cytrynowa/brzoskwiniowa", price: "5", english_description: "lemon/peach", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "SOKI CAPPY 0,2l", english_name: "CAPPY JUICES 0,2l", description: "", price: "5", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "BURN 0,25l", english_name: "", description: "", price: "10", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "DR PEPPER 0,33l", english_name: "", description: "", price: "8", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "SOK ŚWIEŻO WYCISKANY 0,2l", english_name: "FRESH JUICES 0,2l", description: "", price: "9", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "LEMONIADA 0,2l", english_name: "LEMONADE 0,2l", description: "", price: "7", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "FRITZ-KOLA RÓŻNE ZMAKI 0,33l", english_name: "FRITZ-KOLA DIFFERENT FLAVORS 0,33l", description: "", price: "10", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "JOHN LEMON 0,33l", english_name: "", description: "", price: "10", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "WOSTOK 0,33l", english_name: "", description: "", price: "10", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)
DrinkItem.create!(name: "YERBA MATE / Z GRANATEM 0,33l", english_name: "YERBA MATE / WITH POMEGRANATE 0,33l", description: "", price: "10", english_description: "", drink_group: DrinkGroup.find_by_name("POJEDYNEK W CORRALU O.K."), user: admin)

MenuGroup.all.each_with_index do |menu_group, index|
  menu_group.update_attributes(number: (index+1)*10)
  menu_group.menu_items.each_with_index do |menu_item, index_menu_items|
    menu_item.update_attributes(number: (index_menu_items+1)*10)
  end
end

DrinkGroup.all.each_with_index do |drink_group, index|
  drink_group.update_attributes(number: (index+1)*10)
  drink_group.drink_items.each_with_index do |drink_item, index_menu_items|
    drink_item.update_attributes(number: (index_menu_items+1)*10)
  end
end
