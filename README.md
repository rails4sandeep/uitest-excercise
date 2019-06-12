## Introduction
The tests are written in Ruby. They use Watir as the webdriver. RSpec as the test runner.
The tests follow the popular page object pattern. The page class implements all the common
methods used. The browser class generates browser instances. All the other classes
that represent pages of the test application inherit the page class.

## Installation
If you do not have Ruby already installed, the best way is to follow the instructions at http://rvm.io/
Once Ruby is installed

`gem install bundler`

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


