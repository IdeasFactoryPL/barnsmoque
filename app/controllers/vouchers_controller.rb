class VouchersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_voucher, only: [:update, :destroy, :edit, :show]

	def index
		@vouchers = Voucher.order(:code)
	end
	def new
		@voucher = Voucher.new
		if Voucher.count > 0
			@last_code = Voucher.last.code
		end
	end
	def create
		@voucher = Voucher.create(voucher_params)
		if @voucher.save
			flash[:success] = "Dodano voucher"
			redirect_to vouchers_path
		else
			if @voucher.errors.any?
				@voucher.errors.each do |attribute, message|
					flash[:error] = message
				end
			else
				flash[:error] = "Nie udało się dodać vouchera"
			end
			render 'new'
		end
	end
	def update
		if @voucher.update(voucher_params)
			flash[:success] = "Zaktualizowano voucher"
			redirect_to vouchers_path(@voucher)
		else			
			if @voucher.errors.any?
				@voucher.errors.each do |attribute, message|
					flash[:error] = message
				end
			else
				flash[:error] = "Nie udało się zaktualizować vouchera"
			end
			render 'edit'
		end
	end
	def destroy
		if @voucher.present?
			@voucher.destroy
			flash[:success] = "Usunięto voucher"
			redirect_to vouchers_path
		else
			flash[:error] = "Nie udało się usunąć vouchera"
			redirect_to vouchers_path(@voucher)
		end
	end
	def find
		if params[request.path].present?
			@code = params[request.path]["code"]
			@voucher
			if @code != nil
				@voucher = Voucher.where(code: @code).first
			end
		end
	end
	private
	def voucher_params
		params.require(:voucher).permit(:code, :status)
	end
	def find_voucher
		@voucher = Voucher.find(params[:id])
	end
end
