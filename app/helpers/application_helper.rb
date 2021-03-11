module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      type.to_s
    end
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
