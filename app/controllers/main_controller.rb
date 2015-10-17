class MainController < ApplicationController
	def index
		@news = News.order(:date, :release_date)
		@top_news = []
		@news.each do |news|
			if @top_news.count < 5 and news.release_date <= Time.now
				@top_news << news
			end
		end
	end
end
