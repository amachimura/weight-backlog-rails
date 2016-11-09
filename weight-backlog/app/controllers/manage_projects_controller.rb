class ManageProjectsController < ApplicationController
  def index
    #read loginuser's project list
  end

  def show
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      print ('saved')
      render 'show'
    else
      print ('save failed')
      render 'show'
    end
  end

  def showcreate
    @project = Project.new()
    render 'create'
  end

  def update
  end

  def delete
  end

private
def project_params
  params.require(:project).permit(:project_name,:target_date, :target_weight)
end

end
