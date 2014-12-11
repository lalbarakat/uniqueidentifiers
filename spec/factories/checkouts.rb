require 'faker'

FactoryGirl.define do
	factory :checkout do |f|
		f.student_id { Faker::Number.number(8) }
		f.item_id { Faker::Number.number(8) }
		f.startdate { '2014-12-09 12:12:12' }
		f.enddate { '2014-12-10 10:12:12' }
		f.created_at { '2014-12-09 12:12:12' }
		f.updated_at { '2014-12-10 10:12:12' }
	end
end
