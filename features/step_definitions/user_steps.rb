Given(/^I have user nameded Eric, Laith$/) do
  User.create({:firstname =>"Eric"})
	User.create({:firstname =>"Laith"})
end

When(/^I go to the list of users$/) do
  users_path
end

Given(/^I have no users$/) do
  User.delete_all
end

Given(/^I am on the list of users$/) do
  users_path
end

When(/^I fill "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  @user = { firstname: "Glen", lastname: "Vigus", username: "Gvigus", email: "gvigus@tamu.edu", password_digest: "mypassword",}
end

Then(/^I should have (\d+) user$/) do |arg1|
  User.create(@user)
end

Given(/^I have at least (\d+) user$/) do |arg1|
  User.count.should > 1
end

Given(/^I have at least (\d+) users$/) do |arg1|
  User.count.should > 1
end

When(/^I click on "(.*?)" link within user(\d+)$/) do |arg1, arg2|
  User.delete(arg1)
end

Then(/^I shouldn't see the user(\d+)$/) do |arg1|
  User.delete(User.find_by_id(arg1))
end












