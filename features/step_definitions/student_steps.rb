Given(/^I have student nameded Eric, Laith$/) do
  Student.create({:firstname => "Eric"})
	Student.create({:firstname => "Laith"})
end

When(/^I go to the list of students$/) do
  students_path
end

Given(/^I have no students$/) do
  Student.delete_all
end

Given(/^I have (\d+) student$/) do |arg1|
  Student.count.should > 1
end

Given(/^I am on the list of students$/) do
  students_path
end

Given(/^I have at least (\d+) student$/) do |arg1|
  Student.count.should > 1
end

When(/^I click in remove link within student(\d+)$/) do |arg1|
	Student.find(arg1)
end

Then(/^I shouldn't see the student(\d+)$/) do |arg1|
   Student.delete(Student.find_by_id(arg1))
end

Given(/^I am on the students list$/) do
  students_path
end


