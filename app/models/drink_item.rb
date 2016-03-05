class DrinkItem < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :drink_group
  belongs_to :user
end
