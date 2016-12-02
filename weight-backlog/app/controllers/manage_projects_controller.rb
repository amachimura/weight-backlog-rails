class ManageProjectsController < ApplicationController
require 'date'
include SessionsHelper
include ManageProjectsHelper

  def index
    #read loginuser's project list
  end

  def show
  end

  def create
    @completeparams = project_params
    print('\n params:')
    print(@completeparams[:project].to_s)
    @completeparams.permit!
    @project = Project.new(@completeparams[:project])
    if @project.save
      print ('saved')
      @numberOfSprint = generateAndSaveSprints(@project)
      @currentSprint = Sprint.find_by(user_id: current_user.id, is_active: true)
      render 'project_created'
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
  @current_user ||= User.find_by(id: session[:user_id])
  saveCurrentWeight(@current_user, params[:current_weight])
  params[:project][:user_id] = @current_user[:id]
  params[:project][:start_weight] = @current_user[:weight]
  params[:project][:start_date] = Date.today
  params[:project][:is_active] = true
  params[:project][:days_of_sprint] = 7
  return params
end

def saveCurrentWeight(user, weight)
  user[:weight] = weight
  user.save
end

end
