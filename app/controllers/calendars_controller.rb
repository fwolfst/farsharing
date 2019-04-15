class CalendarsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_cars, only: [:show]

  def show
    authorize! :calendar
    today = Date.today

    if calendar_params[:day] == 'today'
      range = today.beginning_of_day..today.end_of_day
      interval_duration = 2
    elsif calendar_params[:week] == 'this'
      range = today.beginning_of_week.beginning_of_day..today.end_of_week.end_of_day
      interval_duration = 4
    else
      range = TimelineCreator.next_three_days
      interval_duration = 6
    end

    @timelines = @cars.map do |car|
      TimelineCreator.for(car,
        range,
        interval_duration: interval_duration)
    end
  end

  private

  def set_cars
    @cars = Car.all
  end

  def calendar_params
    params.fetch(:calendar, {}).permit(:year, :month, :day, :week, :feature_id, :car_id, :location_id)
  end
end
