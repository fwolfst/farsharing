class TimelineCreator
  def self.next_three_days
    now = DateTime.now

    time_at_last_hour  = DateTime.new(now.year, now.month, now.day, now.hour)
    time_in_three_days = time_at_last_hour + 3

    time_at_last_hour..time_in_three_days
  end

  def self.for car, range, interval_type: Timeline::HOURS, interval_duration: 2
    reservations = car.events.between(range)

    timeline = Timeline.new(time_range: range,
                            interval_duration: interval_duration,
                            interval_type: interval_type,
                            resource: car)
    timeline.populate_intervals reservations

    timeline
  end
end
