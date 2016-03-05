class MenuGroupsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_menu_groups, only: [:edit, :update, :show, :destroy]

  def new
    @menu_group = MenuGroup.new
    @start_date = Time.now
  end

  def index
    @menu_groups = MenuGroup.all
  end

  def edit
    @start_date = @menu_group.start_date
  end

  def create
    @menu_group = MenuGroup.new(menu_group_params)
    @menu_group.user_id = current_user.id
    if @menu_group.save
      flash[:success] = "Dodano grupę menu"
      redirect_to menu_groups_path
    else
      error_message("Nie udało się dodać grupy menu")
      render 'new'
    end
  end

  def destroy
    if @menu_group.present?
      @menu_group.destroy
      flash[:success] = "Usunięto grupę menu"
      redirect_to menu_groups_path
    else
      flash[:error] = "Nie udało się usunąć grupy menu"
      redirect_to menu_groups_path(@menu_group)
    end
  end

  def update
    @menu_group.user_id = current_user.id
    if @menu_group.update(menu_group_params)
      flash[:success] = "Zaktualizowno grupę menu"
      redirect_to menu_group_path(@menu_group)
    else
      error_message("Nie udało się zaktualizować grupy menu")
      render 'new'
    end
  end

  private
  def find_menu_groups
    @menu_group = MenuGroup.find(params[:id])
  end
  def menu_group_params
    params.require(:menu_group).permit(:name, :english_name, :number, :start_date, :end_date, menu_item_ids: [])
  end
  def error_message(message)
    model_error_message = ""
    if @menu_group.errors.present?
      model_error_message = "<br>" + @menu_group.errors.messages.first[1][0]
    end
    flash[:error] = message + model_error_message
  end
end
