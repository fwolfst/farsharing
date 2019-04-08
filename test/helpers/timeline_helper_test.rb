class TimelineHelperTest < ActionView::TestCase
  test "should return the correct css class for covered events" do
    event_start_time = DateTime.civil(2019,4,4,16)
    event_end_time   = DateTime.civil(2019,4,4,17,30)

    event = Event.new(
      start_time: event_start_time,
      end_time:   event_end_time
    )

    slice_start_time = DateTime.civil(2019,4,4,16,0)
    slice_end_time   = DateTime.civil(2019,4,4,18)
    slice = slice_start_time..slice_end_time
 
    assert_equal ['ends-left', 'ends-right'].sort,
      timeline_occupancy_class(event, slice).sort
  end
end
