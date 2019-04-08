module TimelineHelper
  def timeline_occupancy_class(reservation, slice)
    classes = []

    classes << 'ends-right' if slice.cover? reservation.end_time
    classes << 'ends-left'  if slice.cover? reservation.start_time
    classes << 'open' if classes.length == 0

    classes
  end

  def timeline_cell_class(reservations)
    reservations.empty? ? '' : 'occupied'
  end
end
