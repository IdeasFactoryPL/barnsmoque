class MainController < GenericController
	def index
		@news = News.order(date: :desc, release_date: :desc)
		@top_news = []
		@news.each do |news|
			news.description = nl2br(news.description)
			if @top_news.count < 5 and news.release_date <= Time.now
				@top_news << news
			end
		end
	end
end
