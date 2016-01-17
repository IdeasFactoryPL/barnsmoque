class AttemptsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_attempt, only: [:show, :update, :destroy, :edit]

	def new
		@attempt = Attempt.new
		@seasons = Season.all
		if Attempt.last != nil
			@last_name = Attempt.last.name
			@last_surname = Attempt.last.surname
		else
			@last_name = ""
			@last_surname = ""
		end
	end

	def create
		@attempt = Attempt.new(attempt_params)
		@attempt.user_id = current_user.id
		@minute = @attempt.minute
		@second = @attempt.second
		@hundredths_of_second = @attempt.hundredths_of_second
		@minute = 59 if @attempt.minute == nil
		@second = 59 if @attempt.second == nil
		@hundredths_of_second = 99 if @attempt.hundredths_of_second == nil
		if Attempt.where(name: @attempt.name.titleize, surname: @attempt.surname.titleize, minute: @minute, second: @second, hundredths_of_second: @hundredths_of_second, season_id: @attempt.season_id).present?
			flash[:error] = "Nie udało się dodać świniobijca, prawdopodobnie taki już istnieje w #{view_context.link_to 'tym sezonie', season_path(get_season_number)}"
			redirect_to new_attempt_path
		else
			if @attempt.save
				flash[:success] = "Dodano świniobijca"
				if @attempt.avatar.blank?
					redirect_to season_path(get_season_number)
				else
					render action: 'crop'
				end
			else
				flash[:error] = "Nie udało się dodać świniobijca"
				render 'new'
			end
		end
	end

	def update
		@attempt.user_id = current_user.id
		if @attempt.update(attempt_params)
			flash[:success] = "Zaktualizowano świniobijca"
			if @attempt.avatar.blank?
				redirect_to season_path(get_season_number)
			else
				if params["commit"] == "Przytnij zdjęcie"
					redirect_to season_path(get_season_number)
				elsif params["commit"] == "Wyślij"
					render action: 'crop'
				end
			end
		else
			flash[:error] = "Nie udało się zaktualizować świniobijca"
			render action: 'edit'
		end
	end

	def edit
		@seasons = Season.all
	end

	def index
		@seasons = Season.all.order(number: :desc)
		@attempts = Attempt.all.order(created_at: :desc)
		@attempts.clear
		@season_numbers = Hash.new { |hash, key| }
		@season_ids = Attempt.pluck(:season_id).uniq
		@season_ids.each do |season_id|
			if Season.where(id: season_id).count > 0
				@season_numbers[season_id] = Season.get_season_number(season_id)
			end
		end
		@season_numbers = @season_numbers.sort_by {|key, value| value}.reverse.to_h
		@season_numbers.each do |key, value|
			@attempts += Attempt.where(season_id: key).order(minute: :asc, second: :asc, hundredths_of_second: :asc)
		end
	end

	def destroy
		if @attempt.present?
			@attempt.destroy
			flash[:success] = "Usunięto świniobijcę"
			redirect_to attempts_path
		else
			flash[:error] = "Nie udało się usunąć świniobijcy"
			render index
		end
	end

	private

	def find_attempt
		@attempt = Attempt.find(params[:id])
	end

	def get_season_number
		@attempt.season_number
	end

	def attempt_params
		params.require(:attempt).permit(:name, :surname, :minute, :second, :hundredths_of_second, :avatar, :season_id, :avatar_original_w, :avatar_original_h, :avatar_box_w, :avatar_aspect, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :user_id)
	end
end
