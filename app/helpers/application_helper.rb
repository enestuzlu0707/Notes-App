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

  def destroy_link_to(path, options)
    link_to t('.destroy'), path,
      :method => :delete,
      :class => 'btn',
      :confirm => t('.destroy_confirm.body', :item => options[:item]),
      'data-confirm-fade' => true,
      'data-confirm-title' => t('.destroy_confirm.title', :item => options[:item]),
      'data-confirm-cancel' => t('.destroy_confirm.cancel', :item => options[:item]),
      'data-confirm-cancel-class' => 'btn-default',
      'data-confirm-proceed' => t('.destroy_confirm.proceed', :item => options[:item]),
      'data-confirm-proceed-class' => 'btn-danger'
  end
end
