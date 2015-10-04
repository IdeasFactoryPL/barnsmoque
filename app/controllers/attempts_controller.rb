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
		
		if @attempt.minute == nil and @attempt.second == nil and @attempt.hundredths_of_second == nil
			if @attempt.minute == nil
				@attempt.minute = 59
			end
			if @attempt.second == nil
				@attempt.second = 59
			end
			if @attempt.hundredths_of_second == nil
				@attempt.hundredths_of_second = 99
			end
		else
			if @attempt.minute == nil
				@attempt.minute = 0
			end
			if @attempt.second == nil
				@attempt.second = 0
			end
			if @attempt.hundredths_of_second == nil
				@attempt.hundredths_of_second = 0
			end
		end
		if @attempt.save
			flash[:success] = "Dodano świniobijca"
			if @attempt.avatar.blank?
				get_season_number
				redirect_to season_path(@season_number)
			else
				render action: 'crop'
			end
		else
			flash[:error] = "Nie udało się dodać świniobijca"
			render 'new'
		end
	end

	def update
		if @attempt.update(attempt_params)
			get_season_number
			flash[:success] = "Zaktualizowano świniobijca"
			redirect_to season_path(@season_number)
		else
			flash[:error] = "Nie udało się zaktualizować świniobijca"
			render action: 'edit'
		end
	end

	private

	def find_attempt
		@attempt = Attempt.find(params[:id])
	end

	def get_season_number
		@season_number = Season.find(@attempt.season_id).number
	end

	def attempt_params
		params.require(:attempt).permit(:name, :surname, :minute, :second, :hundredths_of_second, :avatar, :season_id, :avatar_original_w, :avatar_original_h, :avatar_box_w, :avatar_aspect, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
	end
end
