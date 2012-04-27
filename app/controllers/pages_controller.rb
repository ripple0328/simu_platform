# encoding: utf-8
class PagesController < ApplicationController
  def input
    @title = "首页"
  end

  def help
    @title = "帮助"
  end

  def contact
    @title = "联系我"
  end

  def about
    @title = "关于"
  end

  def status
    @title = '集群负载状态'
  end
end
