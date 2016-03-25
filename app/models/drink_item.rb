class DrinkItem < Menu
  acts_as_paranoid
  belongs_to :drink_group
  belongs_to :user
end
