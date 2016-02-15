module PageObject
  module Platforms
    module SeleniumWebDriver
      module Label

        #
        # choose the label
        #
        def choose
          wait_for_ajax
          element.click
          wait_for_ajax
        end

      end
    end
  end
end
