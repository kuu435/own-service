class FavoritesController < ApplicationController
     before_action :require_user_logged_in

def create
    user=current_user
    post=Post.find_by(params[:post_id])
    if Favorite.create(user_id: user.id,post_id:post.id)
    flash[:success] = 'お気に入りにしました。'
    redirect_to post
    else
      redirect_to root_url
    end

end

  def destroy
    user=current_user
    post=Post.find_by(params[:post_id])
    if favorite=Favorite.find_by(user_id: user.id,post_id:post.id)
      favorite.delete
      flash[:success] = 'お気に入りを外しました'
      redirect_to root_path(current_user)
    else
      redirect_to root_url
    end
  end
end