class EventsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    authorize!
  end

  def show
    authorize! @event
  end

  def new
    @event = Event.new
    authorize! @event
  end

  def edit
    authorize! @event
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    authorize! @event

    if @event.save
      redirect_to @event, notice: t('event.interaction.create.success')
    else
      render :new
    end
  end

  def update
    authorize! @event
    if @event.update(event_params)
      redirect_to @event, notice: t('event.interaction.edit.success')
    else
      render :edit
    end
  end

  def destroy
    authorize! @event
    @event.destroy
    redirect_to events_url, notice: t('event.interaction.destroy.success')
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:start_time, :end_time, :kind, :details, :car_id)
  end
end
