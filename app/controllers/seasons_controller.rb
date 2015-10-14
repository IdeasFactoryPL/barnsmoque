class SeasonsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_season, only: [:show, :edit]

  def new
    @season = Season.new
  end
  
  def index
    @season = Season.last
    get_season_stuff
    render :show
  end

  def show
    get_season_stuff
  end

  def edit

  end

  def update
    find_season_by_id
    if @season.update(season_params)
      flash[:success] = "Zaktualizowano sezon " + @season.number.to_s + " świniobicia"
      redirect_to season_path(@season.number)
    else
      flash[:error] = "Nie udało się zakutalizować sezonu " + @season.number.to_s + " świniobicia"
      render 'edit'
    end
  end

  def list
    @seasons = Season.all
  end

  def destroy
    @season = Season.find(params[:id])
    if @season.present?

      @season.destroy
      flash[:success] = "Usunięto sezon świniobicia"
      redirect_to seasons_list_path
    else
      flash[:error] = "Nie udało się usunąć sezonu świniobicia"
      redirect_to seasons_list_path
    end
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
  def find_season_by_id
    @season = Season.find(params[:id])
  end
  def season_params
    params.require(:season).permit(:description, :number, :html_code)
  end
end
