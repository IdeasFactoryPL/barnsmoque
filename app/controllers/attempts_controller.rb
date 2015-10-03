class AttemptsController < ApplicationController
	def new
		@attempt = Attempt.new
		@seasons = Season.all
	end
	def create
		@attempt = Attempt.new(attempt_params)
		if @attempt.save
			flash[:success] = "Dodano świniobijca"
			@season = Season.find(@attempt.season_id)
			@season.attempts = @season.attempts.order(:minute, :second)
			redirect_to season_path(@season.number)
		else
			flash[:error] = "Nie udało się dodać świniobijca"
		end
	end

	private
	def attempt_params
		params.require(:attempt).permit(:name, :surname, :minute, :second, :hundredths_of_second, :avatar, :season_id)
	end
end
