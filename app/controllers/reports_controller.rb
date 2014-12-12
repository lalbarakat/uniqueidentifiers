class ReportsController < ApplicationController
  def index
  end
  
  def all
  	@co_items = CheckedoutItem.where("status = 0").all
  end
  
  def by_checkout_date
  	checkout_date = Date.parse(params[:year] + params[:month] + params[:day])
  	@co_items = CheckedoutItem.where("status = 0 AND startdate BETWEEN ? AND ?", checkout_date.beginning_of_day, checkout_date.end_of_day).all
  end
  
  def by_return_date
  	return_date = Date.parse(params[:year] + params[:month] + params[:day])
  	@co_items = CheckedoutItem.where("status = 0 AND enddate BETWEEN ? AND ?", return_date.beginning_of_day, return_date.end_of_day).all
  end
  
  
  def by_student_uin
  	@co_items = CheckedoutItem.joins(:student).where("checkedout_items.status = 0 AND students.uin = ?", params[:uin]).all
  end
  
  def by_student_name
  	@checkouts = Checkout.joins(:student).where("checkouts.status = 0 AND students.firstname = ? AND students.lastname = ?", params[:firstname], params[:lastname]).all
  	@co_items = CheckedoutItem.joins(:student).where("checkedout_items.status = 0 AND students.firstname = ? AND students.lastname = ?", params[:firstname], params[:lastname]).all
  end
end
