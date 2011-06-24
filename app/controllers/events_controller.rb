class EventsController < ApplicationController

  def index
    @events = Event.all
    
  end

  def show
    @investor = Investor.find(params[:investor_id])
    @event = @investor.events.find(params[:id])
    @breadcrumb = "Investors > #{@investor.name} > #{@event.name}"
  end

  def new
    @investor = Investor.find(params[:investor_id])
    @event = @investor.events.new
    @breadcrumb = "Investors > #{@investor.name} > Add Event"
    @user_investors = User.where('investor_id = ?', @investor)
  end
  
  def create
    @investor = Investor.find(params[:investor_id])
    @event = @investor.events.new(params[:event].merge(:user_id => current_user.id))
    
    if @event.save
      redirect_to investor_path(@investor)
    else
      render :new
    end
  end

  def edit
    @investor = Investor.find(params[:investor_id])
    @event = @investor.events.find(params[:id])
    @breadcrumb = "Investors > #{@investor.name} > #{@event.name} > Edit"
    @user_investors = User.where('investor_id = ?', @investor)
    
    @refer_id = params[:refer_id]

  end
  
  def update
    params[:event][:attendee_ids] ||= []
    @investor = Investor.find(params[:investor_id])
    @event = @investor.events.find(params[:id])
    
    if @event.update_attributes(params[:event])
      if params[:refer_id] == 'event_index'
        redirect_to events_path
      else
        redirect_to @investor
      end
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @investor = @event.investor
    @event.destroy
    redirect_to @investor
  end
  
end
