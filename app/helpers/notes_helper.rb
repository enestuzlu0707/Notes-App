module NotesHelper
  def note_date(date)
    date.strftime('Posted on %b, %d %Y - %H:%M')
  end

  def badge_class_for_priority(priority)
    case priority
    when 'low'
      'primary'
    when 'medium'
      'warning'
    when 'high'
      'danger'
    else
      'secondary'
    end
  end

  def priorities
    Note.priorities.keys.map { |priority| [priority.humanize, priority]}
  end
end
