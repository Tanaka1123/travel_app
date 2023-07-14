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
      form_data = params['_json']
      form_data.each do |data|
        bookmark_data = data['bookmark']
        bookmark_detail_data = data['bookmark_detail']
  
        bookmark = Bookmark.new(destination: bookmark_data['destination'],
                                departure_date: bookmark_data['departure_date'],
                                return_date: bookmark_data['return_date'],
                                members: bookmark_data['members'],
                                user_id: current_user.id)
  
        unless bookmark.save
          render json: { message: '保存に失敗しました' }, status: 422
          return
        end
  

  
        unless bookmark_detail.save
          render json: { message: '保存に失敗しました' }, status: 422

          bookmark_detail = bookmark.build_bookmark_detail(day: bookmark_detail_data['day'],
            time: bookmark_detail_data['time'],
            location: bookmark_detail_data['location'],
            description: bookmark_detail_data['description'])
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
    params.require(:bookmark).require(:bookmark_detail).permit(:day, :time, :location, :description)
  end
end
