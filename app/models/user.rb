class User < ActiveRecord::Base
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable
  belongs_to :role
  before_create :set_default_role
  has_many :menu_groups
  has_many :menu_items
  has_many :drink_groups
  has_many :drink_items
  validates_length_of :password, :password_confirmation, minimum: 8, allow_blank: true
  def has_role?(role_name)
    self.role.name == role_name
  end

  def name_and_surname
    self.name + " " + self.surname
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('zarejestrowany')
  end
end
