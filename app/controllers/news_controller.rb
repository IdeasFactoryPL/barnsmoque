class NewsController < ApplicationController
	
	before_action :authenticate_user!
	
	def new
		@news = News.new
	end
	def index
		@news = News.all
	end
	def create
		@news = News.create(news_params)
		if @news.save?
			flash[:success] = "Dodano aktualność"
			redirect_to news_index_path
		else
			flash[:error] = "Nie udało się dodać aktualności"
			render 'new'
		end
	end


	private
	def news_params
		params.require(:news).permit(:title, :date, :description, :link_name, :link_to)
	end

	def find_news
		@news = News.find(params[:id])
	end
end
