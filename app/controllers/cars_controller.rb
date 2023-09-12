class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  after_action :verify_authorized, only: :show
  after_action :verify_policy_scoped, only: :index

  def index
    @cars = policy_scope(Car)
    @cars = Car.search(params[:query]) if params[:query].present?
  end

  def show
    @car = policy_scope(@car).first
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = current_user.cars.build(car_params)
    authorize @car
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @car = policy_scope(@car).first
  end

  def update
    @car = policy_scope(@car).first
    if @car.update(car_params)
      redirect_to car_path(@car), notice: "Your car was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = policy_scope(@car).first
    @car.destroy
    redirect_to cars_path, notice: "Car was successfully destroyed."
  end

  def mycars
    @cars = current_user.cars
    authorize @cars
  end

  private

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :km, :color, :type, :price, :location, :avaiable, :description, :user_id, photos: [])
  end
end
