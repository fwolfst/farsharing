require 'test_helper'
require 'availability'

class AvailabilityTest < ActiveSupport::TestCase
  test "#given? returns true on unused resource" do
    car = Car.new(license_plate: 'CAR-NEW 1', name: 'car')
    range = DateTime.now..(DateTime.now + 1)
    assert Availability.new(car).given?(range)
  end

  test "#given? returns true on resource with no usage during given time" do
    car = cars(:bunny_mobile)

    range = DateTime.civil(2019,3,1)..DateTime.civil(2019,3,3)
    assert Availability.new(car).given?(range)
  end

  test "#given? finds usages covered" do
    car = cars(:bunny_mobile) # has event(:easter) usage

    range = DateTime.civil(2019,4,2)..DateTime.civil(2019,4,3)
    refute Availability.new(car).given?(range)
  end

  test "#given? finds overlapping usages at start" do
    car = cars(:bunny_mobile) # has event(:easter) usage

    range = DateTime.civil(2019,3,2)..DateTime.civil(2019,4,3)
    refute Availability.new(car).given?(range)
  end

  test "#given? finds overlapping usages at end" do
    car = cars(:bunny_mobile) # has event(:easter) usage

    range = DateTime.civil(2019,4,2)..DateTime.civil(2019,5,2)
    refute Availability.new(car).given?(range)
  end

  test "#given? finds usages that span" do
    car = cars(:bunny_mobile) # has event(:easter) usage

    range = DateTime.civil(2019,3,2)..DateTime.civil(2019,5,2)
    refute Availability.new(car).given?(range)
  end

  test "#given? accepts single dates, too" do
    car = cars(:bunny_mobile) # has event(:easter) usage

    not_a_range = DateTime.civil(2019,4,2)
    refute Availability.new(car).given?(not_a_range)
    not_a_range = DateTime.civil(2019,3,2)
    assert Availability.new(car).given?(not_a_range)
  end
end
