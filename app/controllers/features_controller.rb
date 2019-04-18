class FeaturesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  def index
    @features = Feature.all
    authorize!
  end

  def show
    authorize! @feature
  end

  def new
    @feature = Feature.new
    authorize! @feature
  end

  def edit
    authorize! @feature
  end

  def create
    @feature = Feature.new(feature_params)
    authorize! @feature

    if @feature.save
      add_flash notice: t('feature.interaction.create.success')
      redirect_to @feature
    else
      render :new
    end
  end

  def update
    authorize! @feature
    if @feature.update(feature_params)
      add_flash notice: t('feature.interaction.edit.success')
      redirect_to @feature
    else
      render :edit
    end
  end

  def destroy
    authorize! @feature
    @feature.destroy
    add_flash notice: t('feature.interaction.destroy.success')
    redirect_to features_url
  end

  private

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name, :icon)
  end
end
