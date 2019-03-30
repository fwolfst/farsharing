require 'test_helper'
require 'availability_check'

class AvailabilityCheckTest < ActiveSupport::TestCase
  test "#perform! sets errors and returns false on unavailability" do
    car = cars(:bunny_mobile)
    range = DateTime.civil(2019,4,2)..DateTime.civil(2019,4,3)
    
    event = car.events.build start_time: range.begin, end_time: range.end
    availability_check = AvailabilityCheck.new(car, event)
    refute availability_check.perform!
    assert_equal event.errors[:car_id], ['nicht verfügbar']
  end
end

