# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  
private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
  end
  def current_user?(user)
    user == current_user
  end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end

    #如果文件名有空格，可能造成识别服务器识别不正确，需要函数来去掉
    def getfilename(filename)
      if !filename.nil?
        filename.split(' ').to_s
      end
    end
  helper_method :current_user, :current_user?,:redirect_back_or,
         :store_location, :clear_return_to, :getfilename
end
