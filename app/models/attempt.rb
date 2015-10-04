class Attempt < ActiveRecord::Base
	belongs_to :season
	validates :name, presence: :true
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/person.jpg"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  	def time
  		if self.minute == "" or self.second == "" or self.hundredths_of_second == ""
  			"poddał się"
  		else
  			self.minute.to_s + ":" + self.second.to_s + ";" + self.hundredths_of_second.to_s
  		end
  	end

  	def name_and_surname
  		if name and surname != ""
  			name + " " + surname
  		elsif name != "" and surname == ""
  			name
  		end
  	end

  	def name_surname_time
  		name_and_surname + " " + time
  	end
end
