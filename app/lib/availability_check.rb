class AvailabilityCheck
  attr_reader :resource
  attr_reader :event

  def initialize resource, event
    @resource = resource
    @event    = event
  end

  # check Availability of resource at events time.
  # add error at :car_id of event, if resource is not available
  def perform!
    if Availability.new(@resource).given?(@event.time_range)
      return true
    else
      @event.errors.add :car_id, :resource_not_available
      return false
    end
  end
end
