require './spec/pages/page'

class Home < Page

  def initialize(browser)
    @elements = {
        :search_tf_id => "gh-ac",
        :search_btn_id => "gh-btn",
        :cart_li_id => "gh-cart"
    }
    @b = browser
    super(browser, @elements)
  end

  def search_for(item)
    @b.text_field(:id => @elements[:search_tf_id]).wait_until(&:present?)
    @b.text_field(:id => @elements[:search_tf_id]).scroll.to
    item.split('').each do |x|
      @b.text_field(:id => @elements[:search_tf_id]).send_keys x
    end
  end

  def click_search
    @b.button(:id => @elements[:search_btn_id]).wait_until(&:present?)
    @b.button(:id => @elements[:search_btn_id]).scroll.to
    @b.button(:id => @elements[:search_btn_id]).click
  end

  def open_cart
    @b.li(:id => @elements[:cart_li_id]).wait_until(&:present?)
    @b.li(:id => @elements[:cart_li_id]).scroll.to
    @b.li(:id => @elements[:cart_li_id]).click
  end

end