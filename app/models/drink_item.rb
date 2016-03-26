class DrinkItem < Menu
  acts_as_paranoid
  belongs_to :drink_group
  belongs_to :user

  def price
    if read_attribute(:price).present?
      read_attribute(:price)
    else
      "zapytaj kelnera"
    end
  end
end
