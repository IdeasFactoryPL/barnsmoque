class MenuGroup < ActiveRecord::Base
  has_many :menu_items, dependent: :nullify
  belongs_to :user
  acts_as_paranoid
  scope :order_by_number, -> {order(:number)}
  scope :order_by_number_with_date, -> {where("(start_date <= ? OR start_date IS ?) AND (end_date >= ? OR end_date IS ?)", Time.now, nil, Time.now, nil).order(:number)}
  validates :name, presence: true
  validate :start_date_less_than_end_date?

  def menu_items_ordered_by_number
    self.menu_items.where("(start_date <= ? OR start_date IS ?) AND (end_date >= ? OR end_date IS ?)", Time.now, nil, Time.now, nil).order(:number)
  end

  def start_date_less_than_end_date?
    if start_date.present? and end_date.present? and start_date > end_date
      errors.add(:start_date, "Data rozpoczęcia wyświetlania grupy menu powinna być mniejsza od jej daty zakończenia")
    end
  end

  def free_and_own
    MenuItem.free + self.menu_items
  end
end
