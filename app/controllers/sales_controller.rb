class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def create
    @sale = Sale.create(sale_params)
    if @sale.save
      redirect_to sale_path(@sale)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to sales_path, notice: "Sale was successfully destroyed."
  end

  private
  def sale_params
    params.require(:car).permit(:user_id, :car_id)
  end
end
