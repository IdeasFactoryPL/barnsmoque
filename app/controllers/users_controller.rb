class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_user, only: [:update, :destroy, :edit, :show]
	before_action :all_users_and_roles, only: [:new, :edit, :update]
	def new
		@user = User.new
	end
	def create
		@user = User.create(user_params)
		if @user.save
			flash[:success] = "Użytkownik został utworzony"
			redirect_to user_path(@user)
		else
			flash[:error] = "Nie udało się utworzyć użytkownika"
			render 'new'
		end
	end
	def index
		@users = User.all
	end
	def update
		if params[:user][:password].blank?
  			params[:user].delete(:password)
  			params[:user].delete(:password_confirmation)
		end
		if @user.update(user_params)
			flash[:success] = "Zaktualizowano użytkownika"
			redirect_to user_path
		else
			flash[:error] = "Nie udało się zaktualizować użytkownika"
			render 'edit'
		end
	end
	def destroy
		if @user.present?
			@user.destroy
			flash[:success] = "Usunięto użytkownika"
			redirect_to users_path
		else
			flash[:error] = "Nie udało się usunąć użytkownika"
			redirect_to user_path(@user)
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
	end
	def find_user
		@user = User.find(params[:id])
	end
	def all_users_and_roles
		@users = User.all
		@roles = Role.all
	end
end
