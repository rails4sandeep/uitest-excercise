require './spec/pages/page'

class Cart < Page

  def initialize(browser)
    @elements = {
        :items_div_data_test_id => "app-cart",
        :item_div_data_test_id => "cart-bucket",
        :remove_button_data_test_id => "cart-remove-item"
    }
    @b = browser
    super(browser, @elements)
  end

  def get_cart_items_count
    @b.div(:data_test_id => @elements[:items_div_data_test_id]).div(:data_test_id => @elements[:item_div_data_test_id]).wait_until(&:present?)
    @b.div(:data_test_id => @elements[:items_div_data_test_id]).divs(:data_test_id => @elements[:item_div_data_test_id]).count
  end

  def remove_cart_item(index)
    @b.buttons(:data_test_id => @elements[:remove_button_data_test_id])[index].wait_until(&:present?)
    @b.buttons(:data_test_id => @elements[:remove_button_data_test_id])[index].scroll.to
    @b.buttons(:data_test_id => @elements[:remove_button_data_test_id])[index].click
  end

  def wait_for_cart_refresh(current_count)
    Watir::Wait.until {@b.divs(:data_test_id => @elements[:item_div_data_test_id]).count < current_count}
  end

end