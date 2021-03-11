module NotesHelper
  def note_date(date)
    date.strftime('Posted on %b, %m %Y - %H:%M')
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
end
