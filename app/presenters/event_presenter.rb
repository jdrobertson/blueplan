class EventPresenter
  delegate :name, :description, :songs, :id,  to: :@event

  def initialize(event)
    @event = event
  end

  def start_time
    @event.starts_at.strftime("%l:%M %p")
  end

  def start_date
    @event.starts_at.strftime("%A %e %B, %Y")
  end

  def start_date_short
    @event.starts_at.strftime("%d/%m/%y")
  end

  def end_time
    @event.ends_at.strftime("%l:%M %p")
  end

  def end_date
    @event.ends_at.strftime("%A %e %B, %Y")
  end
end
