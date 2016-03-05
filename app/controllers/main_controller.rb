class MainController < GenericController

	before_action :get_menu

	def index
		@news = News.order(date: :desc, release_date: :desc)
		@top_news = []
		@news.each do |news|
			news.description = nl2br(news.description)
			if @top_news.count < 3 and news.release_date <= Time.now
				@top_news << news
			end
		end
	end

	def get_menu
		@menu_items = MenuGroup.order_by_number_with_date.map(&:menu_items).flatten.size
		@first_menu_group = []
		@second_menu_group = []
		MenuGroup.order_by_number_with_date.each do |menu_group|
			if @first_menu_group.map{|m| m.menu_items.size}.sum < @menu_items/2
				@first_menu_group << menu_group
			else
				@second_menu_group << menu_group
			end
		end
	end
end
