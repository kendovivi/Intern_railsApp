class Comment < ActiveRecord::Base
  belongs_to :post
  has_secure_password
  validates_presence_of :commenter, message: "Name can not be blank!"
  validates_length_of :commenter, minimum: 3, maximum: 20, message: "Name should be 6 to 20 characters!"
end
