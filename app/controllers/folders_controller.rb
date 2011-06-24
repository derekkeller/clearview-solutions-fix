class FoldersController < ApplicationController

  def index
    @folders = Folder.all
    @breadcrumb = "Documents"
  end

  def show
    @folder = Folder.find(params[:id])
    @documents = @folder.documents
    @breadcrumb = "Documents > #{@folder.name}"
  end

  def new
    @folder = Folder.new
    @breadcrumb = "Documents > Add Folder"
  end

  def create
    @folder = Folder.new(params[:folder])
    
    if @folder.save
      redirect_to @folder
    else
      render :new
    end
  end

  def edit
    @folder = Folder.find(params[:id])
  end

  def update
    @folder = Folder.find(params[:id])
    
    if @folder.update_attributes(params[:folder])
      redirect_to folders_path
    else
      render :edit
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy
    redirect_to folders_path
  end

end
