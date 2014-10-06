module PageObject
  module Platforms
    module WatirWebDriver
      module Label

        #
        # choose the label
        #
        def choose
          sleep 0.5
          element.click
          wait_for_ajax
        end

      end
    end
  end
end
