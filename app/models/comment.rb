class Comment < ActiveRecord::Base
  belongs_to :post
  has_secure_password
end
