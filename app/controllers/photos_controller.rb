class PhotosController < ApplicationController

  def index
    @photos = PhotoDecorator.decorate_collection Photo.ordered
  end

  def show
    @photo = PhotoDecorator.decorate Photo.find params[:id]
  end
end
