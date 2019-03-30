class Availability
  attr_reader :resource

  def initialize resource
    @resource = resource
  end

  def given? time_range
    range = time_range.is_a?(DateTime) ? time_range..time_range : time_range
    # TODO use a scoped query for this and have a way to prevent self occludance
    !@resource.events.where("start_time <= ? AND end_time >= ?", range.end, range.begin).any?
  end
end
