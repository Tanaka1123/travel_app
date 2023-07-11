class BookmarksController < ApplicationController

  def index
    @bookmark = current_user.bookmarks
  end
  def new
    @bookmark = Bookmark.new

  end
  



    def edit
      @bookmark = Bookmark.find(params[:id])
    end

    def save_form_data
      form_data = JSON.parse(request.body.read)
      
      form_data.each do |data|
        bookmark_data = data['bookmark']
        bookmark = current_user.bookmarks.build(bookmark_data.except('bookmark_detail_attributes'))
        bookmark_detail = bookmark.bookmark_details.build(bookmark_data['bookmark_detail_attributes'])
      
        unless bookmark.save && bookmark_detail.save
          render json: { message: '保存に失敗しました' }, status: 422
          return
        end
      end
    
      render json: { message: '保存が成功しました' }, status: 200
    end
  

  

  private

  def bookmark_params
    params.require(:bookmark).permit(:destination, :departure_date, :return_date, :members, :name).merge(user_id: current_user.id)
  end
  

  def bookmark_detail_params
    params.require(:bookmark).require(:bookmark_detail_attributes).permit(:day, :time, :location, :description)
  end
end
