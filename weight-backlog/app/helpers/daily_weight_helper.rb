module DailyWeightHelper
  def findCurrentSprint(userId)
    sprint = Sprint.find_by(user_id: userId, is_active: true)
    return sprint
  end

  def isEndOfSprint(daily_weight, sprint)
     #とりあえずdaily_weightの日付がsprintの最後の日だったらendにする
     return sprint[:target_date] == daily_weight[:date]
  end
end
