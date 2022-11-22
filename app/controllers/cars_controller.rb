class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def update
    if @car.update!(car_params)
      redirect_to @car, notice: "Your car was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: "Car was successfully destroyed."
  end

  def create
    @car = Car.create(car_params)
    @car.user = User.first
    # current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :photo, :year, :color, :km, :price, :location, :description)
  end
end
