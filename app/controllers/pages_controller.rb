class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :work, :contact]

  def index
    @index_class = 'current'
  end
  
  def work
    @work_class = 'current'
  end
  
  def contact
    @contact_class = 'current'
  end

end
