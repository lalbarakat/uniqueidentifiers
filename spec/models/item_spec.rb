require 'spec_helper'

describe Item do
	it "has a valid factory" do
		FactoryGirl.create(:item).should be_valid
	end
	
	it "can check in equipment" do
		FactoryGirl.build(:item, name: 'equipment', created_at: '2014-12-09 12:12:12', updated_at: '2014-12-10 12:12:12').should be_valid
	end
end
