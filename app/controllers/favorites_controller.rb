class FavoritesController < ApplicationController
     before_action :require_user_logged_in

def create
  post = Post.find(params[:post_id])
  if current_user.favorite(post)
    flash[:success] = 'お気に入りにしました。'
    redirect_to post
  else
    redirect_to root_url
  end
end

  def destroy
    post=Post.find(params[:post_id])
    if current_user.unfavorite(post)
      flash[:success] = 'お気に入りを外しました'
      redirect_to root_path(current_user)
    else
      redirect_to root_url
    end
  end
end