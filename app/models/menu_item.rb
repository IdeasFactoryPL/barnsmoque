class MenuItem < ActiveRecord::Base
  belongs_to :menu_group
  belongs_to :user
  acts_as_paranoid
  scope :order_by_number, -> {order(:number)}
  scope :item_without_menu_group, -> {where(menu_group_id: nil)}
  scope :free, -> {where(menu_group_id: nil)}
end
