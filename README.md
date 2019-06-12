## Introduction
The tests are written in Ruby. They use Watir as the webdriver. RSpec as the test runner.

## Installation

`bundle install`

## Running

`rspec spec/ebay_test.rb --format documentation`

## Running tests in parallel
If we want to run two parallel tests

`parallel_rspec -n 2 spec/ebay_test.rb`

Change the value to the number of parallel tests to run

## Configuration

The `./spec/config/browser.json` can be edited to point the tests to various browsers.
The json can also be used to configure the browser timeout, screen sizes and other options.


