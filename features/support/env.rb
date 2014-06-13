require 'uri'
require 'net/http'
require "factory_girl/step_definitions"

require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'cucumber'

World(PageObject::PageFactory)

Before do
  @browser ||= BrowserDriver.get(ENV['BROWSER'])
end

After do
  @browser.close
end

class BrowserDriver
  def self.get(browser=nil)
    case ENV['BROWSER']
      when 'ff', 'Firefox'
        browser = Selenium::WebDriver.for :firefox
      when 'chrome'
        browser = Selenium::WebDriver.for :chrome
      when 'debug'
        debug_profile = Selenium::WebDriver::Firefox::Profile.new
        debug_profile.add_extension "firebug-1.9.1-fx.xpi"
        browser = Selenium::WebDriver.for :firefox, :profile => debug_profile
      when 'mobile'
        mobile_profile = Selenium::WebDriver::Firefox::Profile.new
        mobile_profile['general.useragent.override'] = "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en)
          AppleWebKit/420+ (KHTML, like Gecko) Version/3.0
          Mobile/1A535b Safari/419.3"
        browser = Selenium::WebDriver.for :firefox, :profile => mobile_profile
      when 'headless'
        headless_profile = Headless.new
        headless_profile.start
        browser = Selenium::WebDriver.for :firefox
      else
       browser = Selenium::WebDriver.for :firefox
    end
  end
end
