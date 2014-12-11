require 'spec_helper'

describe Checkout do
	it "has a valid factory" do
		FactoryGirl.create(:checkout, student_id: 'adfadsf').should be_valid
	end
	
	it "can check in equipment" do
		FactoryGirl.build(:checkout).should be_valid
	end
	
	it "is invalid without a student_id" do
		FactoryGirl.build(:checkout, student_id: nil).should_not be_valid
	end
	
	it "is invalid without a lastname" do
		FactoryGirl.build(:checkout, item_id: nil).should_not be_valid
	end
	
	it "update time should not earlier than create time" do
		FactoryGirl.build(:checkout, created_at: '2014-12-09 12:12:12', updated_at: '2014-12-08 12:12:12').should_not be_valid
	end
	
end
