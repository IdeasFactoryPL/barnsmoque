class DrinkGroup < Menu
  acts_as_paranoid
  has_many :drink_items
  has_many :drink_groups
  belongs_to :drink_group
  belongs_to :user
  scope :order_by_number_with_date, -> {where("(start_date <= ? OR start_date IS ?) AND (end_date >= ? OR end_date IS ?) AND (drink_group_id IS ?)", Time.now, nil, Time.now, nil, nil).order(:number)}

  def drink_items_ordered_by_number
    self.drink_items.where("(start_date <= ? OR start_date IS ?) AND (end_date >= ? OR end_date IS ?)", Time.now, nil, Time.now, nil).order(:number)
  end
end
