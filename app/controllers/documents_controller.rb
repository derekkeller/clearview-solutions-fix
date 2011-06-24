class DocumentsController < ApplicationController

  def index
    @folder = Folder.find(params[:folder_id])
    @documents = Document.all
  end

  def show
    @folder = Folder.find(params[:folder_id])
    @document = @folder.documents.find(params[:id])
    @breadcrumb = "Documents > #{@folder.name} > #{@document.name}"
  end

  def new
    @folder = Folder.find(params[:folder_id])
    @document = @folder.documents.new
    @breadcrumb = "Documents > #{@folder.name} > Add Document"
  end

  def create
    @folder = Folder.find(params[:folder_id])
    @document = @folder.documents.build(params[:document])
    
    if @document.save
      redirect_to folder_path(@folder)
    else
      render :new
    end
  end

  def edit
    @folder = Folder.find(params[:folder_id])
    @document = @folder.documents.find(params[:id])
    @breadcrumb = "Documents > #{@folder.name} > #{@document.name} > Edit"
  end

  def update
    @folder = Folder.find(params[:folder_id])
    @document = @folder.documents.find(params[:id])
    
    if @document.update_attributes(params[:document])
      redirect_to folder_path(@folder)
    else
      render :edit
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @folder = @document.folder
    @document.destroy
    redirect_to folder_path(@folder)
  end

  def download_attachment
    @document = Document.find(params[:id])
    redirect_to @document.attachment.url
  end

end
