module EventsHelper
  def display_from_to event
    I18n.t('event.from_to', from: I18n.l(event.start_time, format: :mid), to: I18n.l(event.end_time, format: :mid))
  end
end
