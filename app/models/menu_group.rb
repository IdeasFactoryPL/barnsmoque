class MenuGroup < ActiveRecord::Base
  acts_as_paranoid
  has_many :menu_items
  belongs_to :menu_group
end
