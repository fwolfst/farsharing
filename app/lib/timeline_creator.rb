class TimelineCreator
  def self.next_three_days
    now = DateTime.now

    time_at_last_hour  = DateTime.new(now.year, now.month, now.day, now.hour)
    time_in_three_days = time_at_last_hour + 3

    time_at_last_hour..time_in_three_days
  end

  def self.for car, range
    reservations = car.events.between(range)

    timeline = Timeline.new(time_range: range,
                            interval_duration: 2,
                            interval_type: Timeline::HOURS,
                            resource: car)
    timeline.populate_intervals reservations

    timeline
  end
end
