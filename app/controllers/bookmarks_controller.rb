class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_bookmark, only: [:edit, :update, :show, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @bookmark = current_user.bookmarks
  end
  def new
    @bookmark = Bookmark.new
  end

  
    def create
      @bookmark = current_user.bookmarks.build(bookmark_params)
      if @bookmark.save
        redirect_to root_path, notice: 'Bookmark was successfully created.'
      else
        render 'new'
      end
    end
    
    def edit
    end

 def update
  @bookmark = Bookmark.find(params[:id])
  if @bookmark.update(bookmark_params)
    redirect_to bookmarks_path, notice: 'Bookmark was successfully updated.'
  else
    render 'edit'
  end
end

    def show
    end

    def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
      redirect_to bookmarks_path, notice: "ブックマークを削除しました。"
    end
  
    private

    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end
  
    def check_owner
      unless @bookmark.user == current_user
        redirect_to root_path, alert: 'Access denied.'
      end
    end
  
    def bookmark_params
      params.require(:bookmark).permit(  :destination, :departure_date, :return_date, :members, :name,
        schedules_attributes: [:id, :day, :time, :location, :description, :_destroy]
      )
    end
  end
