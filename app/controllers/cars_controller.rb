class CarsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
    authorize!
  end

  def show
    authorize! @car
  end

  def new
    @car = Car.new
    authorize! @car
  end

  def edit
    authorize! @car
  end

  def create
    @car = Car.new(car_params)
    authorize! @car

    if @car.save
      redirect_to @car, notice: t('car.created')
    else
      render :new
    end
  end

  def update
    authorize! @car
    if @car.update(car_params)
      redirect_to @car, notice: t('car.updated')
    else
      render :edit
    end
  end

  def destroy
    authorize! @car
    @car.destroy
    redirect_to cars_url, notice: t('car.destroyed')
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :license_plate, :manufacture, :make,
                                :number_seats, :description, :image)
  end

end