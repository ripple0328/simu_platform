# encoding: utf-8
class SessionsController < ApplicationController

  def new
    @title = "sign in"
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
#      redirect_to user_url(user), :notice => "你已经登录!"
      redirect_back_or user
      flash[:success] = "你已经登录!"
    else
      flash.now.alert = "邮件地址或密码错误"
      @title = 'Sign in'
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "已经注销!"
  end
end
