class BugsController < ApplicationController
  before_action :set_types

  def index
    @bugs = Bug.all
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)

    # https://cis.gvsu.edu/~kurmasz/Teaching/Courses/W20/CIS658/LectureNotes/DemoScripts/RailsDemo03.html
    if bug_params[:user_id]
      begin
        user = User.find(bug_params[:user_id])
        @bug.build_user(:id => user.id)
      rescue
        puts "Error creating user!"
      end  
    end

    if @bug.save
      redirect_to @bug
    else
      render 'new'
    end
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def update
    @bug = Bug.find(params[:id])

    if @bug.update(bug_params)
      redirect_to @bug
    else
      render 'edit'
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    redirect_to bugs_path
  end

  def set_types
    @issue_types = Bug.issue_types
    @priorities = Bug.priorities
    @statuses = Bug.statuses
  end
  
  private
    def bug_params
      params.require(:bug).permit(:title, :description, :issue_type, :priority, :status, :user_id)
    end
end
