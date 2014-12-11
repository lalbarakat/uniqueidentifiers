require 'faker'

FactoryGirl.define do
	factory :item do |f|
		f.name { Faker::Name.name }
		f.created_at { '2014-12-09 12:12:12' }
		f.updated_at { '2014-12-10 10:12:12' }
	end
end
