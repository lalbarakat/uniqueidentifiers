class ReportsController < ApplicationController
  def index
  end
  
  def all
  	@checkouts = Checkout.all
  end
  
  def by_checkout_date
  	checkout_date = Date.parse(params[:year] + params[:month] + params[:day])
  	@checkouts = Checkout.includes(:checked_out_items).where('checked_out_items.startdate BETWEEN ? AND ?', checkout_date.beginning_of_day, checkout_date.end_of_day).all
  end
  
  def by_return_date
  	return_date = Date.parse(params[:year] + params[:month] + params[:day])
  	@checkouts = Checkout.includes(:checked_out_items).where('checked_out_items.enddate BETWEEN ? AND ?', return_date.beginning_of_day, return_date.end_of_day).all
  end
  
  def by_student
  	@checkouts = Checkout.includes(:student).where('students.id = ?', params[:id]).all
  end
end
