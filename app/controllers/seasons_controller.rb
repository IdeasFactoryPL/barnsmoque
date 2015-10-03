class SeasonsController < ApplicationController
  before_action :find_season, only: [:show]
  def index
    # @number = 
  end

  def show
    @number = RomanNumerals.to_roman(@season.number)
    @description = @season.description
    @html_code = @season.html_code
    if @html_code != nil
      @html_code = "<p>" + @html_code + "</p>"
    end
    @attempts = @season.attempts
  end

  private
  def find_season
    @season = Season.where(number: params[:id]).first
  end
end
