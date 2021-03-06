class MenuGroup < Menu
  has_many :menu_items, dependent: :nullify
  belongs_to :user
  acts_as_paranoid
  scope :order_by_number, -> {order(:number)}
  scope :order_by_number_with_date, -> {where("(start_date <= ? OR start_date IS ?) AND (end_date >= ? OR end_date IS ?)", Time.now, nil, Time.now, nil).order(:number)}

  def menu_items_ordered_by_number
    self.menu_items.where("(start_date <= ? OR start_date IS ?) AND (end_date >= ? OR end_date IS ?)", Time.now, nil, Time.now, nil).order(:number)
  end

  def free_and_own
    MenuItem.free + self.menu_items
  end
end
