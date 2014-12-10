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
  	@checkouts = Checkout.joins(:student).where('students.uin = ?', params[:uin]).all
  	#@students = @checkouts.collect { |checkout| checkout.student }
  	#@items = @checkouts.collect { |checkout| checkout.checked_ }
  end
end
