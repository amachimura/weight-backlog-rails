class DailyWeight < ActiveRecord::Base

  def isLastDayOfSprint
    currentSprint = findCurrentSprint(self.user_id)
    result = self[:date] == currentSprint[:target_date]
    print(result.to_s)
    return result
  end
  def findCurrentSprint
    sprint = Sprint.find_by(user_id: self.user_id, is_active: true)
    print ("findCurrentSprint of model")
    return sprint
  end

end
