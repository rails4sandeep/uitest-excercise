class Page

  def initialize(browser, page_objects)
    @elements = {
    }
    @b = browser
    @elements = @elements.merge(page_objects)
  end

  def wait_for_redirect(url)
    Watir::Wait.until { @b.url == url }
  end

  def wait_for_text(text)
    Watir::Wait.until { @b.text.include? text }
  end

  def wait_for_message_expire(text)
    Watir::Wait.while { @b.text.include? text }
  end

  def check_for_text(text)
    @b.text.include? text
  end

  def check_text_count(text)
    @b.text.scan(/(?=#{text})/).count
  end

  def url
    @b.url
  end

  def open(url)
    @b.goto(url)
  end

  def reset_default_timeout(timeout)
    Watir.default_timeout = timeout
  end

  def full_screen
    @b.driver.manage.window.maximize
  end

  def procrastinate(sec)
    sleep sec
  end

  def switch_to_new_window
    procrastinate(5)
    @b.windows.last.use
  end

  def close_window
    @b.close
  end

  def take_screenshot
    @b.screenshot.png
  end

  def get_title
    puts "page title: #{@b.title}"
    @b.title
  end

end
