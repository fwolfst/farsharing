module TimelineHelper
  def timeline_occupancy_class(reservation, slice)
    if slice.cover? reservation.end_time
      ['ends-right']           
    elsif slice.cover? reservation.start_time
      ['ends-left']            
    else
      ['open']
    end
  end

  def timeline_cell_class(reservations)
    reservations.empty? ? '' : 'occupied'
  end
end
