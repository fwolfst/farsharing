class CarsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.with_attached_image.all
    authorize!

    @timelines = @cars.map do |car|
      TimelineCreator.for(car,
        TimelineCreator.next_three_days)
    end
  end

  def show
    authorize! @car

    @timeline = TimelineCreator.for(
      @car,
      TimelineCreator.next_three_days)
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
      redirect_to @car, notice: t('car.interaction.create.success')
    else
      render :new
    end
  end

  def update
    authorize! @car
    if @car.update(car_params)
      redirect_to @car, notice: t('car.interaction.edit.success')
    else
      render :edit
    end
  end

  def destroy
    authorize! @car
    @car.destroy
    redirect_to cars_url, notice: t('car.interaction.destroy.success')
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :license_plate, :manufacture, :make,
                                :num_seats, :description, :image)
  end

end
