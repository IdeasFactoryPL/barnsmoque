class Attempt < ActiveRecord::Base
  acts_as_paranoid
  include FindUser
  belongs_to :season
  validates :name, :season_id, presence: :true
  before_create :titleize_name_and_surname, :check_time
  has_attached_file :avatar, :styles => {:thumb => '50x50', :medium => '500x500'}, :default_url => "/images/original/person.jpg"
  crop_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def time
    if self.minute == 59 and self.second == 59 and self.hundredths_of_second == 99
      "poddał się"
    else
      self.minute.to_s + ":" + self.second.to_s.rjust(2, '0') + ";" + self.hundredths_of_second.to_s.rjust(2, '0')
    end
  end

  def name_and_surname
    if self.name != nil and self.surname != nil
      self.name + " " + self.surname
    elsif self.name != nil and self.surname == nil
      self.name
    end
  end

  def name_surname_time
    name_and_surname + " " + time
  end

  def titleize_name_and_surname
    self.name = self.name.titleize
    self.name = self.name.strip
    self.surname = self.surname.titleize
    self.surname = self.surname.strip
  end

  def season_number
    Season.get_season_number(self.season_id)
  end

  def check_time
    if self.minute == nil and self.second == nil and self.hundredths_of_second == nil
      self.minute = 59 if self.minute == nil
      self.second = 59 if self.second == nil
      self.hundredths_of_second = 99 if self.hundredths_of_second == nil
    else
      self.minute = 0 if self.minute == nil
      self.second = 0 if self.second == nil
      self.hundredths_of_second = 0 if self.hundredths_of_second == nil
    end
  end
end
