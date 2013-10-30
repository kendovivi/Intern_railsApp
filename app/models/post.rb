class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  validates :title, presence: true,length: { minimum: 5}
  #validates :tag, presence: true

  
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
