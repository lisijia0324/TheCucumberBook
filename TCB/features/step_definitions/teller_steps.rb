
When /^I request ("#{CAPTURE_A_NUMBERß}")$/ do |amount|
  teller.withdraw_from(my_account, amount)
end