class ScanController < ApplicationController
  def add_items
  	@student = Student.find_by_uin(params[:uin]) || 
    		Student.create(:firstname => params[:firstname], :lastname => params[:lastname], :email => params[:email], :phonenumber => params[:phonenumber], :uin => params[:uin])
	@checkout = Checkout.new(params[:checkout])
	@checkout.student = @student
  end
end
