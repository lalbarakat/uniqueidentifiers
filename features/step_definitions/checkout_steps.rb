Given(/^I have checkout for item(\d+), item(\d+)$/) do |arg1, arg2|
	Checkout.create({:student_id => "1", :status =>"0"})
	Checkout.create({:student_id => "2", :status =>"0"})
end

When(/^I go to the list of checkouts$/) do
	checkouts_path
end

Given(/^I have no checkouts$/) do
 	Checkout.delete_all
end

Given(/^I am on the dashbord$/) do
	root_path
end

Then(/^I should scan "(.*?)"$/) do |arg1|
 @checkout = {:student_id => "1", :status =>"0"}
end

Then(/^I should have (\d+) checkout$/) do |arg1|
  Checkout.create(@checkout)
end

Given(/^I am on the checkouts list$/) do
  checkouts_path
end

Given(/^I have at least (\d+) checkout$/) do |arg1|
 	Checkout.count.should > 1
end

Given(/^I am on the list of checkouts$/) do
  checkouts_path
end

When(/^I click on "(.*?)" link within checkout(\d+)$/) do |arg1, arg2|
  Checkout.delete(arg2)
end

