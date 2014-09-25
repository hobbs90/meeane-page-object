module PageObject
  module Elements
    class Label < Element

      def initialize(element, platform)
        @element = element
        include_platform_for platform
      end

      protected

      def self.watir_finders
        super + [:text]
      end

      def self.selenium_finders
        super + [:text]
      end

      def include_platform_for platform
        super
        if platform[:platform] == :watir_webdriver
          require 'page-object/platforms/watir_webdriver/label'
          self.class.send :include, PageObject::Platforms::WatirWebDriver::Label
        elsif platform[:platform] == :selenium_webdriver
          require 'page-object/platforms/selenium_webdriver/radio_button'
          self.class.send :include, PageObject::Platforms::SeleniumWebDriver::Label
        else
          raise ArgumentError, "expect platform to be :watir_webdriver or :selenium_webdriver"
        end
      end
    end

    ::PageObject::Elements.tag_to_class[:label] = ::PageObject::Elements::Label
  end
end
