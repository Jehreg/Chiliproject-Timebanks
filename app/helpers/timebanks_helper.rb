module TimebanksHelper

  def timebank_menu(&block)
    menu_items = []
    menu_items << link_to(l(:label_new_timebank), 'timebank/new', :class => 'icon icon-timebank-new')

    yield menu_items if block_given?

    return content_tag(:div, menu_items.join(' '), :class => "contextual nonprinting", :id => "timebank-menu") +
      content_tag(:div, '', :style => 'clear: both')

  end

end
