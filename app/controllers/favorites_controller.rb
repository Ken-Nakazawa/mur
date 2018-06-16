class FavoritesController < ApplicationController
  def create
    @item ||= Item.find_by(rakutenitem_id: params[:rakutenitem_id])
    if @item.nil?
      @item = Item.new
      @item.rakutenitem_id = params[:rakutenitem_id]
      @item.item_name = params[:item_name]
      @item.item_url = params[:item_url]
      @item.itemimage_url = params[:itemimage_url]
      @item.save
    end
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.item_id = @item.id
    if favorite.save
      redirect_to rakuten_search_path(keyword: params[:keyword]), notice: 'お気に入りに登録しました'
    else
      redirect_to rakuten_search_path(keyword: params[:keyword]), notice: 'お気に入り登録に失敗しました'
    end
  end

  def delete
    @item ||= Item.find_by(rakutenitem_id: params[:rakutenitem_id])
    favorite = Favorite.find_by(user_id: current_user.id, item_id: @item.id)
    if favorite.destroy
      redirect_to rakuten_search_path(keyword: params[:keyword]), notice: 'お気に入りを解除しました'
    else
      redirect_to rakuten_search_path(keyword: params[:keyword]), notice: 'お気に入り解除に失敗しました'
    end
  end
end
