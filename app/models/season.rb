class Season < ActiveRecord::Base
  acts_as_paranoid
	include FindUser
	has_many :attempts

	validates :description, :number, presence: true

	def self.get_season_number(id)
		Season.find(id).number
	end
end
