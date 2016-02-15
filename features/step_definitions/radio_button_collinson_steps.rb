When /^I select the "([^\"]*)" collinson radio button$/ do |how|
  @page.send "choose_#{how.downcase}".to_sym
end