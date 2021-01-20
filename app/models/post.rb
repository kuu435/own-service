class Post < ApplicationRecord
    belongs_to :user
    validates :content, presence: true, length: { maximum: 255 }
    mount_uploader :img, ImgUploader
    validate :img_size
    
    def img_size
      if img.size > 5.megabytes
        errors.add(:img, "should be less than 5MB")
      end
    end
   
end
