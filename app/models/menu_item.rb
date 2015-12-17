class MenuItem < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :menu_group
end
