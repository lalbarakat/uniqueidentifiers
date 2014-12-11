require 'faker'

FactoryGirl.define do
	factory :student do |f|
		f.uin { Faker::Number.number(9) }
		f.firstname { Faker::Name.first_name }
		f.lastname { Faker::Name.last_name }
		f.email { Faker::Internet.email }
		f.phonenumber { Faker::PhoneNumber.cell_phone }
		f.status { Faker::Lorem.sentence }
		f.created_at { '2014-12-09 12:12:12' }
		f.updated_at { '2014-12-10 10:12:12' }
	end
end
