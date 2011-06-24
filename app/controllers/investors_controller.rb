class InvestorsController < ApplicationController

  def index
    @investors = Investor.all
    @breadcrumb = 'Investors'
  end

  def show
    @investor = Investor.find(params[:id])
    @events = @investor.events.order('date DESC').all
    @tasks = @investor.tasks.order('due_date ASC').all
    @users = User.where('investor_id = ?', @investor.id)
    @breadcrumb = "Investors > #{@investor.name}"
  end

  def new
    @investor = Investor.new
    @breadcrumb = "Investors > Add Investor"
  end
  
  def create
    @investor = Investor.new(params[:investor])
    if @investor.save
      redirect_to investors_path
    else
      render :new
    end
  end
    
  def edit
    @investor = Investor.find(params[:id])  
    @breadcrumb = "Investors > #{@investor.name} > Edit"
  end
  
  def update
    @investor = Investor.find(params[:id])

    if @investor.update_attributes(params[:investor])
      redirect_to @investor
    else
      render :edit
    end
  end
  
  def destroy
    @investor = Investor.find(params[:id])
    @investor.destroy
    redirect_to investors_path
  end
    
end
