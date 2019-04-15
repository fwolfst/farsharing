require 'test_helper'

class TimelineTest < ActiveSupport::TestCase
  test "it can be constructed with options" do
    timeline = Timeline.new time_range: DateTime.now..(DateTime.now + 1),
      interval_duration: 2,
      interval_type: Timeline::DAYS
    assert timeline
    assert_equal Timeline::DAYS, timeline.interval_type
  end

  test "num_intervals can count days" do
    today_now = DateTime.now
    tomorrow_now = today_now + 1

    range = today_now..tomorrow_now

    timeline = Timeline.new time_range: range,
      interval_duration: 1,
      interval_type: Timeline::DAYS
    assert_equal 1, timeline.num_intervals
  end

  test "num_intervals can count by 1 hour" do
    today_now = DateTime.now
    tomorrow_now = today_now + 1

    range = today_now..tomorrow_now

    timeline = Timeline.new time_range: range,
      interval_duration: 1,
      interval_type: Timeline::HOURS
    assert_equal 24, timeline.num_intervals
  end

  test "num_intervals counts by 2 hours" do
    today_now = DateTime.now
    tomorrow_now = today_now + 2

    range = today_now..tomorrow_now

    timeline = Timeline.new time_range: range,
      interval_duration: 2,
      interval_type: Timeline::HOURS
    assert_equal 24, timeline.num_intervals
  end

  test "returns the intervals (2 hours)" do
    range_start = DateTime.new(2020, 1, 1, 10, 0)
    range_end   = DateTime.new(2020, 1, 1, 16, 0)

    range = range_start..range_end

    timeline = Timeline.new time_range: range,
      interval_duration: 2,
      interval_type: Timeline::HOURS

    assert_equal 3, timeline.intervals.count
    assert_equal [DateTime.new(2020, 1, 1, 10, 0)..DateTime.new(2020, 1, 1, 12, 0),
                  DateTime.new(2020, 1, 1, 12, 0)..DateTime.new(2020, 1, 1, 14, 0),
                  DateTime.new(2020, 1, 1, 14, 0)..DateTime.new(2020, 1, 1, 16, 0),
    ], timeline.intervals
  end

  test "returns the intervals (4 hours)" do
    range_start = DateTime.new(2020, 1, 1,  8, 0)
    range_end   = DateTime.new(2020, 1, 1, 16, 0)

    range = range_start..range_end

    timeline = Timeline.new time_range: range,
      interval_duration: 4,
      interval_type: Timeline::HOURS

    assert_equal 2, timeline.intervals.count
    assert_equal [DateTime.new(2020, 1, 1, 8, 0)..DateTime.new(2020, 1, 1, 12, 0),
                  DateTime.new(2020, 1, 1, 12, 0)..DateTime.new(2020, 1, 1, 16, 0),
    ], timeline.intervals
  end

  test "populates data (1 day)" do
    range_start = DateTime.new(2019, 3, 1, 0, 0)
    range_end   = DateTime.new(2019, 3, 2, 23, 59)
    range = range_start..range_end

    timeline = Timeline.new time_range: range,
      interval_duration: 1,
      interval_type: Timeline::DAYS

    timeline.populate_intervals [events(:one), events(:two)]

    timeline_data = { (range_start..range_start+1) => [events(:one), events(:two)] 
                      #range_end   => [events(:one), events(:two)]
    }

    assert_equal timeline_data, timeline.data
  end

  test "populates data (2 hour)" do
    range_start = DateTime.new(2019, 3, 1, 18, 0)
    range_end   = DateTime.new(2019, 3, 1, 22, 0)
    range = range_start..range_end

    timeline = Timeline.new time_range: range,
      interval_duration: 2,
      interval_type: Timeline::HOURS

    timeline.populate_intervals [events(:one), events(:two)]

    slice_one = DateTime.new(2019, 3, 1, 18, 0)..DateTime.new(2019, 3, 1, 20, 0)
    slice_two = DateTime.new(2019, 3, 1, 20, 0)..DateTime.new(2019, 3, 1, 22, 0)

    timeline_data = {
      slice_one => [events(:one), events(:two)],
      slice_two => [events(:one)],
    }

    assert_equal timeline_data, timeline.data
  end
end
