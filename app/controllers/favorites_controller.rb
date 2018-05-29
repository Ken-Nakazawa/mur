class FavoritesController < ApplicationController
  def create
      favorite = Favorite.new
      favorite.uid = current_uid
      favorite.item_name = params[:item_name]
      favorite.item_url = params[:item_url]
      favorite.itemimage_url = params[:itemimage_url]
      if favorite.save
        redirect_to root_path, notice: 'お気に入りに登録しました'
      else
        redirect_to root_path, notice: 'お気に入りに登録に失敗しました'
      end
    end
  end
