class Cars::EventsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_car, only: [:show, :new, :create, :index]

  def index
    authorize! @car, to: :show?
    @events, @pagy = pagy(@car.events)
  end

  def show
    authorize! @car, to: :show?
    @event = Event.find(params[:id])
    authorize! @event
    render 'events/show'
  end

  def new
    authorize! @car, to: :show?
    @event = @car.events.build(event_params)
    puts event_params.inspect
    @event.creator = current_user
    authorize! @event
    render 'events/new'
  end

  def create
    authorize! @car, to: :show?
    @event = @car.events.create(event_params)
    @event.creator = current_user
    authorize! @event

    if @event.save
      redirect_to @event, notice: t('event.interaction.create.success')
    else
      render :new
    end
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def event_params
    params.fetch(:event, {}).permit(:start_time, :end_time, :kind, :details)
  end
end
