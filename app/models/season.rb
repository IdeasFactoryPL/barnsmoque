class Season < ActiveRecord::Base
	has_many :attempts

	validates :description, :number, presence: true
end
