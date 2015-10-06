require 'rails_helper'

describe "Adding attempt" do

	let!(:season) {Season.create(description: "temp", number: 9)}
	let!(:user) {User.create(email: "renata@barnsmoque.pl", password: "questr12")}
	def devise_login
		user
		visit new_attempt_path
		fill_in "Email", with: "renata@barnsmoque.pl"
		fill_in "Password", with: "questr12"
		click_on("Log in")
		expect(page).to have_content("Jeśli uczestnik się poddał to nie uzupełniamy jego czasu")
	end
	describe "is successfull" do
		it "is successfull with valid content" do
			name = Faker::Name.first_name
			devise_login
			fill_in "Imię", with: name
			click_on("Wyślij")
			expect(page).to have_content(name)
		end
		it "with all fields" do
			name = Faker::Name.first_name
			surname = Faker::Name.last_name
			minutes = rand(0..99)
			seconds = rand(0..59)
			hundredths_of_seconds = rand(0..99)
			devise_login
			fill_in "Imię", with: name
			fill_in "Nazwisko", with: surname
			fill_in "Minuty", with: minutes
			fill_in "Sekundy", with: seconds
			fill_in "Setne sekundy", with: hundredths_of_seconds
			click_on "Wyślij"
			expect(page).to have_content(name + " " + surname + " " + minutes.to_s + ":" + seconds.to_s.rjust(2, '0') + ";" + hundredths_of_seconds.to_s.rjust(2, '0'))
		end
	end
	it "check required field" do
		devise_login
		find_field('Imię')[:required].should be_present
	end
end