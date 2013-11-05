class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  validates_presence_of :title, message: "You need to give post a title."
  validates_length_of :title, minimum: 5, message: "the length of title need to be more than 5 characters."
  validates_presence_of :tag_ids, message: "You need to check at least 1 tag"

  
  has_attached_file :avatar, default_url: "/images/missing.png", :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"


  #search by text input in search area or search by tag 
  def self.search(search,tag_id)
    
    if search
      find(:all, conditions: ["title LIKE ?", "%#{search}%"])
    elsif tag_id
      #find post_ids by tag_id
      find(:all, conditions: ["id IN (?)", Tag.find(tag_id).post_ids])
    else
      find(:all)
    end

    
  end

end
