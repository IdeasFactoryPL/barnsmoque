class Season < ActiveRecord::Base
	has_many :attempts

	validates :description, :number, presence: true

	def self.get_season_number(id)
		Season.find(id).number
	end
end
