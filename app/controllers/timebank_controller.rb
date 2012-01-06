class TimebankController < ApplicationController
  unloadable

  layout 'base'

  helper :issues
  include ApplicationHelper
  helper :timelog
  helper :timebanks

  verify :method => :delete, :only => :reset, :render => {:nothing => true, :status => :method_not_allowed }

  def index
    @timebank_list = Array.new
    project_list = Array.new
    projectids_with_timebanks = Timebank.all(:select => 'DISTINCT (project_id)', :group => "project_id")
    projectids_with_timebanks.each do |project_item|
      project_list.push(project_item[:project_id])
    end
    projects_with_timebanks = Project.find(:all, :conditions => { :id => project_list } )
    projects_with_timebanks.each do |project|
       total_bank_hours = 0
       total_time_entry_hours = 0
       timebanks = Timebank.find(:all, :conditions => { :project_id => project[:id] })
       timebanks.each do |timebank|
         total_bank_hours += timebank[:amount_of_time]
       end
       time_entries = project.time_entries
       time_entries.each do |time_entry|
         total_time_entry_hours += time_entry[:hours]
       end
       total_spread = total_bank_hours - total_time_entry_hours
       @timebank_list.push({:project => project, :project_id => project[:id], :total_bank_hours => total_bank_hours, :total_time_entry_hours => total_time_entry_hours, :total_spread => total_spread })
    end
  end

  def summary
       @timebanks = Timebank.find(:all, :conditions => { :project_id => params[:id] })
       @target_project = Project.find_by_id(params[:id])
       render 'list'
  end

  def create
    @timebank = Timebank.new(params[:timebank])
    if @timebank.save
      flash[:notice] = "Time Bank Entry created"
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end

  end

end
