class NewsController < GenericController
	
	before_action :authenticate_user!
	before_action :find_news, only: [:show, :edit, :destroy, :update]

	def new
		@news = News.new
	end
	def index
		@news = News.order(:date)
	end
	def create
		@news = News.create(news_params)
		@news.user_id = current_user.id
		if @news.save
			flash[:success] = "Dodano aktualność"
			redirect_to news_index_path
		else
			flash[:error] = "Nie udało się dodać aktualności"
			render 'new'
		end
	end
	def update
		@news.user_id = current_user.id
		if @news.update(news_params)
			flash[:success] = "Zaktualizowano aktualność po Polsku"
			redirect_to news_path(@news)
		else
			flash[:error] = "Nie udało się zaktualizować aktualności po Polsku"
			render 'edit'
		end
	end
	def destroy
		if @news.present?
			@news.destroy
			flash[:success] = "Usunięto aktualność po Polsku"
			redirect_to news_index_path
		else
			flash[:error] = "Nie można było usunąć aktualności po Polsku"
			redirect_to news_path(@news)
		end
	end
	def show
		@news.description = nl2br(@news.description)
	end
	
	private
	def news_params
		params.require(:news).permit(:title, :date, :description, :link_name, :link_for, :release_date)
	end

	def find_news
		@news = News.find(params[:id])
	end

end
