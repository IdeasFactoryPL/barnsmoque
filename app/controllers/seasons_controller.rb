class SeasonsController < ApplicationController
  before_action :find_season, only: [:show]
  def index
    @season = Season.last
    get_season_stuff
    render :show
  end

  def show
    get_season_stuff
  end

  private
  def get_season_stuff
    @number = RomanNumerals.to_roman(@season.number)
    @description = @season.description
    @html_code = @season.html_code
    if @html_code != nil
      @html_code = "<p>" + @html_code + "</p>"
    end
    @attempts = @season.attempts.sort_by {|attempt| [attempt.minute, attempt.second, attempt.hundredths_of_second] }
  end
  def find_season
    @season = Season.where(number: params[:id]).first
  end
end
