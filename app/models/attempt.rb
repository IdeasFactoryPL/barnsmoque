class Attempt < ActiveRecord::Base
	belongs_to :season
	validates :name, :season_id, presence: :true
  
  has_attached_file :avatar, :styles => {:thumb => '50x50', :medium => '500x500'}, :default_url => "/images/original/person.jpg"
  crop_attached_file :avatar
  # has_attached_file :avatar, :styles => { :small => "100x100#", :large => "500x500>" }, :processors => [:cropper]
  # attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  # after_update :reprocess_avatar, :if => :cropping?
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

  # def cropping?
  #   !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  # end
  
  # def avatar_geometry(style = :original)
  #   @geometry ||= {}
  #   @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  # end
  
  # private
  
  # def reprocess_avatar
  #   avatar.reprocess!
  # end
end
