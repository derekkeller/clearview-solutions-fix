class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @investor = Investor.find(params[:investor_id])
    @task = @investor.tasks.find(params[:id])
    @breadcrumb = "Investors > #{@investor.name} > #{@task.name}"
  end

  def new
    @investor = Investor.find(params[:investor_id])
    @task = @investor.tasks.new
    @breadcrumb = "Investors > #{@investor.name} > New Task"
  end

  def create
    @investor = Investor.find(params[:investor_id])
    @task = @investor.tasks.new(params[:task].merge(:user_id => current_user.id))
 
    if @task.save
      UserMailer.new_task(@task.task_owner, @task.user).deliver
      redirect_to investor_path(@investor)
    else
      render :new
    end
  end
 
  def edit
    @investor = Investor.find(params[:investor_id])
    @task = @investor.tasks.find(params[:id])
    @breadcrumb = "Investors > #{@investor.name} > #{@task.name} > Edit"
  end
  
  def update
    @investor = Investor.find(params[:investor_id])  
    @task = @investor.tasks.find(params[:id])
    
    if @task.update_attributes(params[:task])
      redirect_to @investor
    else
      render :edit
    end
  end
    
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    render :update do |page|
      #page << "#task_#{@task.id.to_s}"
    end
  end

end
