class ReportsController < ApplicationController
  def index
  end
  
  def all
  	@checkouts = Checkout.all
  end
  
  def by_checkout_date
  	checkout_date = Date.parse(params[:year] + params[:month] + params[:day])
  	@checkouts = Checkout.joins(:checkedout_items).where('checkedout_items.startdate BETWEEN ? AND ?', checkout_date.beginning_of_day, checkout_date.end_of_day).all
  end
  
  def by_return_date
  	return_date = Date.parse(params[:year] + params[:month] + params[:day])
  	@checkouts = Checkout.joins(:checkedout_items).where('checkedout_items.enddate BETWEEN ? AND ?', return_date.beginning_of_day, return_date.end_of_day).all
  end
  
  
  def by_student
	sql ="SELECT STUDENTS.*, CHECKOUTS.*,CHECKEDOUT_ITEMS.*,ITEMS.*  FROM STUDENTS, CHECKOUTS,CHECKEDOUT_ITEMS,ITEMS WHERE STUDENTS.ID=CHECKOUTS.STUDENT_ID AND CHECKOUTS.ID=CHECKOUT_ID AND CHECKEDOUT_ITEMS.ITEM_ID=ITEMS.ID AND STUDENTS.UIN='".params[:studentid]."'"
	@result = ActiveRecord::Base.connection.execute(sql)

  	#@checkouts = Checkout.joins(:student).where('students.uin = ?', params[:uin]).all
	#@checkouts = Checkout.joins(:student).where(students => {uin =>123456789})
  	#@students = @checkouts.collect { |checkout| checkout.student }
  	#@items = @checkouts.collect { |checkout| checkout.checked_ }
  end
end
