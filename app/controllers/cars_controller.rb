class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = policy_scope(Car)
    if params[:query].present?
      sql_query = "brand ILIKE :query OR model ILIKE :query OR color ILIKE :query"
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
    end
  end

  def show
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
  end

  def update
    authorize @car
    if @car.update!(car_params)
      redirect_to @car, notice: "Your car was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @car
    @car.destroy
    redirect_to cars_path, notice: "Car was successfully destroyed."
  end

  def create
    @car = Car.create(car_params)
    @car.user = current_user
    authorize @car
    # current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @car
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :km, :color, :type, :price, :location, :avaiable, :description, :user_id, :photo_url)
  end
end
