class SalesController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @sale = Sale.new(car: @car, user: current_user)

    if @sale.save
      redirect_to sale_path(@sale), status: :see_other
    else
      redirect_to car_path(@car.id)
    end
  end

  def show
    @sale = Sale.find(params[:id])
    @car = @sale.car
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to cars_path, notice: "Sale was successfully destroyed."
  end
end
