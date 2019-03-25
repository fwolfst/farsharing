class Timeline
  attr_reader :time_range,
              :interval_duration,
              :interval_type,
              :event_data,
              :resource

  HOURS  = :hours
  DAYS   = :days
  WEEKS  = :weeks
  MONTHS = :months

  def initialize(time_range:, interval_duration:, interval_type:, resource: nil)
    @time_range    = time_range.begin.to_datetime..time_range.end.to_datetime
    @interval_type = interval_type
    @interval_duration = interval_duration
    #@event_data = []
    @resource = resource
  end

  def num_intervals
    @num_intervals ||= @time_range.begin.step(@time_range.end,
                                              fractional_step_size).count - 1
  end

  def intervals
    @intervals ||= @time_range.begin.step(@time_range.end, fractional_step_size).to_a.each_cons(2).map {|start, finish| (start..finish) }
  end

  def populate_intervals events
    @event_data ||= intervals.map do |time_slice|
      [time_slice, select_events_in_range(events, time_slice)]
    end.to_h
  end

  def data
    @event_data
  end

  private

  def fractional_step_size
    @fractional_step_size ||= case @interval_type
      when DAYS
        @interval_duration
      when HOURS
        1/24r * @interval_duration
      else
        raise
    end
  end

  def select_events_in_range events, range
    range_start = range.begin
    range_end   = range.end
    events.select do |event|
      # Easy extraction point to allow
      # more general interface (where start and end
      # times are defined by other attributes.
      event.start_time < range_end && event.end_time > range_start
    end
  end
end
