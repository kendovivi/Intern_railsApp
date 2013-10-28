class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,length: { minimum: 5}
  validates :tag, presence: true

  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"


  def self.search(search,tag)
    
    if search
      find(:all, conditions: ['title LIKE ?', "%#{search}%"])
    elsif tag
      find(:all, conditions: {tag: tag})
    else
      find(:all)
    end

    
  	
  end

end