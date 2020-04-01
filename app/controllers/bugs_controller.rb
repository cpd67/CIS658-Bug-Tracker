class BugsController < ApplicationController
  before_action :set_user
  before_action :set_user_post, only: [:show, :update, :destroy]
  before_action :set_types

  def index
    json_response(@user.bugs)
  end

  def show
    json_response(@bug)
  end

  def create
    @user.bugs.create!(bug_params)
    json_response(@user, :created)
  end

  def update
    @bug.update(bug_params)
    head :no_content
  end

  def destroy
    @bug.destroy
    head :no_content
  end
  
  private
    def bug_params
      params.permit(:title, :description, :issue_type, :priority, :status, :user_id)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_user_post
      @bug = @user.bugs.find_by!(id: params[:id]) if @bug
    end
    
    def set_types
      @issue_types = Bug.issue_types
      @priorities = Bug.priorities
      @statuses = Bug.statuses
    end
  
end
