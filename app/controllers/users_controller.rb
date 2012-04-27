# encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :index]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def index
    @title = "All users"
    @users = User.all
  end

  def new
    @user = User.new
    @title = "sign up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "欢迎注册，请等待管理员授权"
      current_user= @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      @title = 'Sign up'
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
   
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "资料已更新."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "用户已删除"
    redirect_to users_path
  end

  def auth
    User.find(params[:id]).toggle!(:auth)
    flash[:success] = "用户已授权"
    redirect_to users_path    
  end


  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def authenticate
      deny_access if current_user.nil?
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
