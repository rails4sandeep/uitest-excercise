class BrowserGenerator

  def new_browser(browser_details)
    case ENV['BROWSER']
    when nil
      if browser_details['headless']
        headless_browser(browser_details)
      else
        simple_browser(browser_details)
      end
    end
    set_default_timeout(browser_details['default_timeout'])
    resize(browser_details['screen_width'], browser_details['screen_height']) if(ENV['BROWSER']!='BSIOS' && ENV['BROWSER']!='BSANDROID')
    @b
  end

  def headless_browser(browser_details)
    if browser_details['browser'] == 'chrome'
      args = ['--no-sandbox','--headless','--disable-dev-shm-usage']
      @b = Watir::Browser.new browser_details['browser'].to_sym,headless: browser_details['headless'],options: {args: args}
    else
      @b = Watir::Browser.new browser_details['browser'].to_sym,headless: browser_details['headless']
    end
  end

  def simple_browser(browser_details)
    @b = Watir::Browser.new browser_details['browser'].to_sym
  end

  def set_default_timeout(timeout)
    Watir.default_timeout = timeout
  end

  def resize(width, height)
    @b.driver.manage.window.resize_to(width, height)
  end

  def maximize
    @b.driver.manage.window.maximize
  end
end