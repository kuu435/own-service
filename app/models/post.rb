class Post < ApplicationRecord
    belongs_to :user
    validates :content, presence: true, length: { maximum: 255 }
    mount_uploader :img, ImgUploader
    validate :img_size
    
    has_many :favorites
    has_many :users, through: :favorites
    
    has_many :comments, dependent: :destroy
    
    def img_size
      if img.size > 5.megabytes
        errors.add(:img, "should be less than 5MB")
      end
    end
    
    def self.search(search)
      if search
        Post.where(['content LIKE ?', "%#{search}%"])
      else
        Post.none
      end
    end
   
end
