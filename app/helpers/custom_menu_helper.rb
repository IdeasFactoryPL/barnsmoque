module CustomMenuHelper
  def show_drink_items_from_drink_group(drink_group)
    @content = "".html_safe
    if drink_group.drink_groups.empty?
      show_drink_items(drink_group)
    else
      drink_group.drink_groups.each do |current_drink_group|
        @content += content_tag :h3 do
                      current_drink_group.name
                    end
        show_drink_items(current_drink_group)
      end
    end
    @content
  end
  def show_drink_items(drink_group)
    drink_group.drink_items.each do |drink_item|
      @content += content_tag :h5 do
                    drink_item.name
                  end
      @content += if drink_item.description.present?
                    content_tag :div, class: 'price' do
                      drink_item.price
                    end
                  else
                    content_tag :div, class: 'price item_without_description' do
                      drink_item.price
                    end
                  end

      @content += content_tag :h6 do
                    drink_item.description
                  end
    end
    @content
  end
end
