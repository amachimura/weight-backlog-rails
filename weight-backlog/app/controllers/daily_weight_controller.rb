class DailyWeightController < ApplicationController
  include SessionsHelper
  include DailyWeightHelper
  require 'date'
  def show
    @daily_weight = DailyWeight.new(user_id: current_user.id,
    sprint_id: findCurrentSprint(current_user.id).id,
    date: Date.today)
    render('show')
  end

  def record
    params.permit!
    @daily_weight = DailyWeight.new(daily_weight_params)
    if @daily_weight.save
      render('record')
    else
      render('show')
    end
  end

 private
 def daily_weight_params
   params.require(:daily_weight).permit(:user_id, :sprint_id, :date, :weight)
 end

end
