class CarsController < ApplicationController
  before_action :set_car, only: %i[edit update show]

  def index
    @car = policy_scope(Car)
    @cars = params[:query] ? Car.where("brand LIKE '%#{params[:query]}%'") : Car.all
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(params_car)
    @car.user = current_user
    authorize @car
    if @car.save
      redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @car
    @car = Car.find(params[:id])
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: :see_other
  end

  def update
    @car = Car.find(params[:id])
    @car.user = current_user
    @car.update(params_car)
    redirect_to car_path(@car)
  end

  def edit
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def params_car
    params.require(:car).permit(:brand, :model, :color, :city, :price, :autonomy, :kilometreage, :photo)
  end
end
