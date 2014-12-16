require 'spec_helper'

describe Checkout do
	it "has a valid factory" do
		FactoryGirl.create(:checkout, student_id: 'adfadsf').should be_valid
	end
	
	it "can check in equipment" do
		FactoryGirl.build(:checkout).should be_valid
	end
	
end
