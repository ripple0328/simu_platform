# -*- coding: utf-8 -*-
class SimulationController < ApplicationController

  def index
    @title = '仿真主页'
  end

  def upload
    require 'fileutils'
    @user_name = current_user.name
    @job_name = params[:job_name]

    @name = params[:file].original_filename
    @directory = Rails.root.join('app/assets/data').join(@user_name).join(@job_name)
    FileUtils.mkdir_p(@directory)  unless File.directory?(@directory)
    @path = File.join(@directory,@name) 
    @result = File.open(@path,'wb') {|f| f.write(params[:file].read)}
    @cluster_selected = params[:cluster]
  end

  def download
    require 'fileutils'
    @user_name = current_user.name
    @job_name = params[:job_name]
    @cluster_selected = params[:cluster]
    @resultPath = Rails.root.join('app/assets/result')

    flash[:success] = @job_name
  end
  
  def download_result
    @job_name = flash[:success]
    @resultPath = Rails.root.join('app/assets/result')
    FileUtils.mkdir_p(@resultPath)  unless File.directory?(@resultPath)
    @resultFile = Rails.root.join('app').join('assets').join('result').join('result.mat')
    File.open(@resultFile, 'rb') do |f| 
      send_data f.read, :disposition => "inline",
      :stream => false,
      :filename => "#{@job_name}.mat"
    end 
    FileUtils.rm @resultFile
  end
  
  def download_template
     @excel_path = Rails.root.join('app').join('assets').join('data')
     @excel_file_name = 'ParameterTable.xls'
     @excel_locate = File.join(@excel_path,@excel_file_name)
     File.open(@excel_locate, 'rb') do |f| 
       send_data f.read, :disposition => "inline",:stream => false,:filename => 'ParameterTable.xls'
    end
  end
end

