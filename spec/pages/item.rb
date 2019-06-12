require './spec/pages/page'

class Item < Page

  def initialize(browser)
    @elements = {
        :add_to_cart_link_id => "isCartBtn_btn",
        :no_thanks_btn_text => "No thanks",
    }
    @b = browser
    super(browser, @elements)
  end

  def add_to_cart
    @b.link(:id => @elements[:add_to_cart_link_id]).wait_until(&:present?)
    @b.link(:id => @elements[:add_to_cart_link_id]).scroll.to
    @b.link(:id => @elements[:add_to_cart_link_id]).click
  end

  def decline_additional_insurance
    @b.button(:text => @elements[:no_thanks_btn_text]).wait_until(&:present?)
    @b.button(:text => @elements[:no_thanks_btn_text]).scroll.to
    @b.button(:text => @elements[:no_thanks_btn_text]).click
  end
end