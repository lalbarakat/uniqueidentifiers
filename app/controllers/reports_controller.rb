class ReportsController < ApplicationController
  def index
  end
  
  def all
  	@checkouts = Checkout.where("status = 0").group(:id)
  end
  
  def by_checkout_date
  	checkout_date = Date.parse(params[:year] + params[:month] + params[:day])
  	@checkouts = Checkout.joins(:checkedout_items).where("checkouts.status = 0 AND checkedout_items.startdate BETWEEN ? AND ?", checkout_date.beginning_of_day, checkout_date.end_of_day).group('checkouts.id')
  end
  
  def by_return_date
  	return_date = Date.parse(params[:year] + params[:month] + params[:day])
  	@checkouts = Checkout.joins(:checkedout_items).where("checkouts.status = 0 AND checkedout_items.enddate BETWEEN ? AND ?", return_date.beginning_of_day, return_date.end_of_day).group('checkouts.id')
  end
  
  def by_student
  	@checkouts = Checkout.joins(:student).where("checkouts.status = 0 AND students.uin = ?", params[:uin]).all
  end
end
