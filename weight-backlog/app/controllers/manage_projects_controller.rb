class ManageProjectsController < ApplicationController
  def index
    #read loginuser's project list
  end

  def show
  end

  def create
    @project = Project.new(params)
    if @project.save
      print ('saved')
      render 'show'
    else
      print ('save failed')
      render 'show'
    end
  end

  def showcreate
    render 'create'
  end

  def update
  end

  def delete
  end
end
