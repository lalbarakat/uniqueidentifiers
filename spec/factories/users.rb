require 'faker'

FactoryGirl.define do
	factory :user do |f|
		f.username { Faker::Internet.user_name }
		f.firstname { Faker::Name.first_name }
		f.lastname { Faker::Name.last_name }
		f.email { Faker::Internet.email }
		f.password { Faker::Internet.password(8) }
	end
end
