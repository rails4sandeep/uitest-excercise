require 'rspec'
require 'watir'
require 'json'
include Selenium

Dir["./spec/pages/*.rb"].each {|file| require file }

RSpec.configure do |config|
  config.before(:example) do

    @browser = JSON.parse(File.read('./spec/config/browser.json'))
    @messages = JSON.parse(File.read('./spec/config/messages.json'))

    @generator = BrowserGenerator.new
    @b = @generator.new_browser(@browser)
  end

end

