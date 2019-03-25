module TimelineHelper
  def timeline_cell_class(reservation, slice)
    if slice.cover? reservation.end_time
      ['ends-right']           
    elsif slice.cover? reservation.start_time
      ['ends-left']            
    else
      ['open']
    end
  end
end
