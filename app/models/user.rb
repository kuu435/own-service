class User < ApplicationRecord
    validates :name, presence: true, length: { maximum:30 }
    validates :email, presence: true, length: { maximum:255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    
    has_secure_password
    
    has_many :posts
    
    has_many :favorites
    has_many :favorite_posts, through:  :favorites, source: :post, dependent: :destroy
    
    has_many :comments, dependent: :destroy
    def like(post)
      favorites.find_or_create_by(post_id: post.id)
    end
    
    def unfavorite(post)
      favorite = self.favorites.find_by(post_id: post.id)
      favorite.destroy if favorite
    end
  
    def favorite?(post)
      self.favorite_posts.include?(post)
    end

    def feed_posts
    @posts = Post.all
    end
end
