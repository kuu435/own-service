class ToppagesController < ApplicationController
  def index
      @posts = Post.all.order_by(created_at: :desc)
  end
end
