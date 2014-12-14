require 'spec_helper'

describe Student do
	it "has a valid factory" do
		FactoryGirl.create(:student).should be_valid
	end
	
	it "can insert student" do
		FactoryGirl.build(:student, firstname: 'bruce', lastname: 'lee', email: 'aaa@google.com', phonenumber: '8885552345', uin: '123456789').should be_valid
	end
	
	it "uin is 9-digest" do
		FactoryGirl.build(:student, uin: '123456789').should be_valid
	end
	
	it "uin should not be other than 9-digest" do
		FactoryGirl.build(:student, uin: '12345678').should_not be_valid
		FactoryGirl.build(:student, uin: '0123456789').should_not be_valid
	end
	
end
