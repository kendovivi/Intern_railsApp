class Comment < ActiveRecord::Base
  belongs_to :post


  #password, password_confirmation validation
  has_secure_password
  validates_length_of :password, minimum: 6, maximum: 14, message: "password should be 6 to 14 characters!" 
  ###########################################

  #commenter validation
  #validates_presence_of :commenter, message: "Name can not be blank!"
  validates_length_of :commenter, minimum: 8, maximum: 20, message: "Name should be 8 to 20 characters!"
  ###########################################

  #body validation
  #validates_presence_of :body, message: "Text can not be blank!"
  validates_length_of :body, minimum: 5, maximum: 140, message: "Text should be 5 to 140 characters!"
  ###########################################
  
end
