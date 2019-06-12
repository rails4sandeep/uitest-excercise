require './spec/pages/page'

class Results < Page

  def initialize(browser)
    @elements = {
        :results_list_li_id => /srp-river-results-listing/,
        :results_list_item_link_count => 2,
        :results_div_id => "srp-river-results",
        :results_list_item_one => "srp-river-results-listing1"
    }
    @b = browser
    super(browser, @elements)
  end

  def wait_for_results_to_load
    Watir::Wait.until {@b.div(:id => @elements[:results_div_id]).ul.lis.count > 0}
    procrastinate(5)
  end

  def open_first_listing
    @b.li(:id => @elements[:results_list_item_one]).wait_until(&:present?)
    @b.li(:id => @elements[:results_list_item_one]).scroll.to
    @b.li(:id => @elements[:results_list_item_one]).click
    @b.li(:id => @elements[:results_list_item_one]).links[@elements[:results_list_item_link_count]].click
  end

end