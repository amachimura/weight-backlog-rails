class Project < ActiveRecord::Base
 def findSprints
  sprints = Sprint.where(project_id: self.id)
  return sprints
 end

end
