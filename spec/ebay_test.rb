require 'spec_helper'

RSpec.describe "ebay" do

  before do
    @home = Home.new(@b)
    @home.open(@messages['home'])
  end

  it 'should be able to search for items in ebay' do
    @home.search_for(@messages['firstSearch'])
    @home.click_search
    @results = Results.new(@b)
    @results.wait_for_results_to_load
    @results.open_first_listing
  end

  it 'should be able to add two items to cart' do
    @home.search_for(@messages['firstSearch'])
    @home.click_search
    @results = Results.new(@b)
    @results.wait_for_results_to_load
    @results.open_first_listing
    @item = Item.new(@b)
    @item.add_to_cart
    @item.decline_additional_insurance
    @home.search_for(@messages['secondSearch'])
    @home.click_search
    @results.open_first_listing
    @item.add_to_cart
    @item.decline_additional_insurance
    @cart = Cart.new(@b)
    expect(@cart.get_cart_items_count).to be == 2
  end

  it 'should be able to remove two items from the cart' do
    @home.search_for(@messages['firstSearch'])
    @home.click_search
    @results = Results.new(@b)
    @results.wait_for_results_to_load
    @results.open_first_listing
    @item = Item.new(@b)
    @item.add_to_cart
    @item.decline_additional_insurance
    @home.search_for(@messages['secondSearch'])
    @home.click_search
    @results.wait_for_results_to_load
    @results.open_first_listing
    @item.add_to_cart
    @item.decline_additional_insurance
    @cart = Cart.new(@b)
    expect(@cart.get_cart_items_count).to equal(2)
    @cart.remove_cart_item(1)
    @cart.wait_for_cart_refresh(@cart.get_cart_items_count)
    @cart.remove_cart_item(0)
    @cart.wait_for_cart_refresh(@cart.get_cart_items_count)
  end
end