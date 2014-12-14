require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist


Given(/^I have items nameded (.+)$/) do |items|
	items.split(', ').each do |item|
		Item.create({:name => "itemname", :category => "itemscat"})
	end
end

When(/^I go to the list of items$/) do
  items_path
end

Then(/^I should see "(.*?)"$/) do |arg1|
  items_path
end

Given(/^I have no items$/) do
  Item.delete_all
end

Given(/^I am on the list of items$/) do
  items_path
end

When(/^I click "(.*?)"$/) do |arg1|
	Item.new
end
When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
	@item = {:name => "itemname", :category => "Category1"}
end

When(/^I slecet "(.*?)" as "(.*?)"$/) do |arg1, arg2|
	@item.merge( :category => "Category1")
end

When(/^I press "(.*?)"$/) do |arg1|
	Item.create(@item)
end

Then(/^I should have (\d+) item$/) do |arg1|
	items_path
end

Given(/^I have at least (\d+) item$/) do |arg1|
	Item.count.should > 1
end

When(/^I follow "(.*?)"$/) do |arg1|
	edit_item_path(:arg1)
end

When(/^I select "(.*?)" as "(.*?)"$/) do |arg1, arg2|
	edit_item_path(Item.find_by_id(1))

end

Then(/^I should see the list if items$/) do
  items_path
end

Given(/^I have at least (\d+) items$/) do |arg1|
  Item.count.should > 1
end

When(/^I click in remove link within item(\d+)$/) do |arg1|
 Item.delete(arg1)
end

When(/^confirm popup$/) do
	#page.driver.browser.switch_to.alert.accept
	#page.execute_script('window.confirm = function() { return true; }')
end

Then(/^I shouldn't see the item(\d+)$/) do |arg1|
   Item.delete(Item.find_by_id(1))
end

When(/^I click on show link within item(\d+)$/) do |arg1|
  Item.find(arg1)
end

When(/^I click print$/) do
	#click_on("Print")
end

Then(/^I shouldn pritn the QR for item(\d+)$/) do |arg1|
 # page.execute_script("popup=window.open(); popup.print();")
end

Given(/^I am on the items list$/) do
  items_path
end








