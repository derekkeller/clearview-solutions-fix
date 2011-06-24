class UsersController < ApplicationController
  def index
    # @admin_users = User.where(role = 1)
    # @manager_users = User.where(:manager => true)
    # @investor_users = User.where(:investor => true)
    @users = User.all
    @breadcrumb = "Users"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end