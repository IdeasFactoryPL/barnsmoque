class MenuItemsController < GenericController

  before_action :authenticate_user!
  before_action :find_menu_item, only: [:edit, :show, :update, :destroy]

  def new
    @menu_item = MenuItem.new
    @start_date = Time.now
  end

  def edit
    @start_date = @menu_item.start_date
    @selected_menu_group = @menu_item.menu_group.id
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.user_id = current_user.id
    if @menu_item.save
      flash[:success] = "Zapisano potrawę"
      redirect_to menu_item_path(@menu_item)
    else
      error_message("Nie udało się zapisać potrawy")
      render 'new'
    end
  end

  def index
    @menu_groups = MenuGroup.all
  end

  def destroy
    if @menu_item.present?
      @menu_item.destroy
      flash[:success] = "Usunięto potrawę"
      redirect_to menu_items_path
    else
      error_message("Nie udało się usunąć potrawy")
      redirect_to menu_items_path(@menu_item)
    end
  end

  def update
    @menu_item.user_id = current_user.id
    if @menu_item.update(menu_item_params)
      flash[:success] = "Zaktualizowno potrawę"
      redirect_to menu_item_path(@menu_item)
    else
      error_message("Nie udało się zaktualizować potrawy")
      render 'new'
    end
  end

  private
  def find_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :english_name, :english_description, :price, :menu_group_id, :number, :start_date, :end_date)
  end
end
