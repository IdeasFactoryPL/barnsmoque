class DrinkGroup < ActiveRecord::Base
  acts_as_paranoid
  has_many :drink_items
  has_many :drink_groups
  belongs_to :drink_group
  belongs_to :user
end
