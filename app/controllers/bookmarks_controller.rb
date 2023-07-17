class BookmarksController < ApplicationController

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
      @bookmark = Bookmark.find(params[:id])
    end

    def update
      @bookmark = Bookmark.find(params[:id])
      if @bookmark.update(bookmark_params)
        redirect_to bookmarks_path, notice: 'Bookmark was successfully updated.'
      else
        render 'edit'
      end
    end
  
    private
  
    def bookmark_params
      params.require(:bookmark).permit(:destination, :departure_date, :return_date, :members, :name,
        :day_1, :time_1, :location_1, :description_1,
        :day_2, :time_2, :location_2, :description_2,
        :day_3, :time_3, :location_3, :description_3,
        :day_4, :time_4, :location_4, :description_4,
        :day_5, :time_5, :location_5, :description_5,
        :day_6, :time_6, :location_6, :description_6,
        :day_7, :time_7, :location_7, :description_7
      )
    end
  end
