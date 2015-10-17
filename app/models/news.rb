class News < ActiveRecord::Base
include ActionView::Helpers::UrlHelper
	def description_with_link
		if self[:description].downcase.include? "#link" or self[:description].downcase.include? "#menu"
			["#link", "#Link"].each do |var|
				self[:description].sub! var, "#{link_to(self[:link_name], self[:link_for])}"
			end
			["#menu", "#Menu"].each do |var|
				self[:description] = self[:description].sub var, link_to(var.sub("#", ""), "#menu")
			end
		end
		self[:description]
	end
	def date_string
		self[:date].day.to_s + " " + I18n.t("date.month_names")[self[:date].month] + " " + self[:date].year.to_s
	end
end
