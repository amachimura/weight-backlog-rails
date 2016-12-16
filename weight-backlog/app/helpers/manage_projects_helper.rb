module ManageProjectsHelper
require 'date'
 def generateAndSaveSprints(project)
  #全スプリント共通の値
  user_id = project[:user_id]
  project_id = project[:id]
  #全体の期間を算出
  sdate = Date.today
  edate = project[:target_date]
  sprintSpan = project[:days_of_sprint]
  baseDate = sdate
  baseWeight = project[:start_weight]

  projectRange = sdate..edate
  numberOfProjectDays = (edate - sdate).to_i
  numberOfSprint = numberOfProjectDays.div(sprintSpan)

  #1スプリントで減らすべき体重を算出
  grossWeightToLose = baseWeight - project[:target_weight]
  weightToLosePerSprint = makeTargetPerSprint(grossWeightToLose, numberOfSprint)

  while baseDate < edate do
    params = {user_id:user_id,
      project_id:project_id,
      start_date:baseDate,
      start_weight:baseWeight}
    sprintEndDate = calcEdate(sprintSpan, baseDate, projectRange)

    params[:target_date] = sprintEndDate
    params[:is_active] = isActive(baseDate, sprintEndDate)
    sprintTarget = baseWeight - weightToLosePerSprint
    params[:target_weight] = sprintTarget

    baseDate = sprintEndDate + 1
    baseWeight = sprintTarget
    #sprintオブジェクトを生成
    sprint = createSprint(params)
    sprint.save
    print('saved a sprint')
  end
  print('★saved ')
  print(numberOfSprint)
  print(' sprints★')
  return numberOfSprint
 end

 def createSprint(sprintParams)
   sprint = Sprint.new(sprintParams)
   return sprint
 end

 def makeTargetPerSprint(remainWeight, numberOfSprint)
   return remainWeight.fdiv(numberOfSprint).round(1)
 end


 def calcEdate(sprintSpan, baseDate, projectRange)
   if projectRange.cover?(baseDate + sprintSpan)
     return baseDate + sprintSpan
   else
     return projectRange.last
   end
 end

 def isActive(baseDate, endDate)
  if Date.today >= baseDate && Date.today <= endDate
    return true
  else
    return false
  end
 end

end
