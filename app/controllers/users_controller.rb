class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        json_response(@users)
    end

    def create
        @user = User.create!(user_params)
        json_response(@user, :created)
    end

    def show
        json_response(@user)
    end

    def update
        if @user.update(user_params)
            head :no_content
        else
            puts "An error occurred when attempting to update the user."
        end
    end

    def destroy
        @user.destroy
        head :no_content
    end

    private
        def user_params
            params.permit(:id, :fname, :lname, :email, :thumbnail)
        end

        def set_user
            @user = User.find(params[:id])
        end
end
