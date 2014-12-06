class ScanController < ApplicationController
  def add_items
  	@student = Student.find_by_uin(params[:uin]) || 
    		Student.new(:firstname => params[:firstname], :lastname => params[:lastname], :email => params[:email], :phonenumber => params[:phonenumber], :uin => params[:uin])
	@checkout = Checkout.new(params[:checkout])
	@checkout.student = @student
	@checkout.checked_out_items.build
	@checkout.checked_out_items[0].build_item
  end
end
