module DailyWeightHelper
  def findCurrentSprint(userId)
    sprint = Sprint.find_by(user_id: userId, is_active: true)
    return sprint
  end
end
