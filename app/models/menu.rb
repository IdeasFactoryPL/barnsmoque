class Menu < ActiveRecord::Base
  self.abstract_class = true
  scope :order_by_number, -> {order(:number)}
  validates :name, presence: true, uniqueness: true
  validates :number, uniqueness: true, allow_nil: true
  validate :start_date_less_than_end_date?
  def start_date_less_than_end_date?
    if start_date.present? and end_date.present? and start_date > end_date
      errors.add(:start_date, "Data rozpoczęcia wyświetlania grupy menu powinna być mniejsza od jej daty zakończenia")
    end
  end
end
