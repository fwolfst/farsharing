class LocationsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
    authorize!
  end

  def show
    authorize! @location
  end

  def new
    @location = Location.new
    authorize! @location
  end

  def edit
    authorize! @location
  end

  def create
    @location = Location.new(location_params)
    authorize! @location

    if @location.save
      add_flash notice: t('location.interaction.create.success')
      redirect_to @location
    else
      render :new
    end
  end

  def update
    authorize! @location
    if @location.update(location_params)
      add_flash notice: t('location.interaction.edit.success')
      redirect_to @location
    else
      render :edit
    end
  end

  def destroy
    authorize! @location
    @location.destroy
    add_flash notice: t('location.interaction.destroy.success')
    redirect_to locations_url
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :details, feature_ids: [])
  end
end
