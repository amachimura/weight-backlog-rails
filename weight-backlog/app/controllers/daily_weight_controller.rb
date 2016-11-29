class DailyWeightController < ApplicationController
  include SessionsHelper
  include DailyWeightHelper
  require 'date'
  def show
    @daily_weight = DailyWeight.new(user_id: current_user.id,
    date: Date.today)
    @daily_weight[:sprint_id] = @daily_weight.findCurrentSprint.id
    render('show')
  end

  def record
    params.permit!
    @daily_weight = DailyWeight.new(daily_weight_params)
    if @daily_weight.save
      if @daily_weight.isLastDayOfSprint
        switchSprint
        render('sprint_plan')
      end
      render('record')
    else
      render('show')
    end
  end

 private
 def daily_weight_params
   params.require(:daily_weight).permit(:user_id, :sprint_id, :date, :weight)
 end
 def switchSprint

 end

end
