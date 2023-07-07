class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      # 保存が成功した場合の処理
      redirect_to root_path
    else
      # 保存が失敗した場合の処理
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:destination, :departure_date, :return_date, :members, :name).merge(
      user_id: current_user.id)
  end
end
