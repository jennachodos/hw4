class Post < ApplicationRecord
  #recognize that there is an attachment 
  has_one_attached :uploaded_image
end
