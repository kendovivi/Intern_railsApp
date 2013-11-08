class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.has_attached_file :avatar

      t.timestamps
    end

    
    Post.create(title: "this is the 1nd post",  text: "failed to use Factorygirl ") 
    Post.create(title: "this is the 2nd post",  text: "try to use fake for test data")
    Post.create(title: "this is the 3rd post",  text: "click the Edit link to add something")
    Post.create(title: "this is the 4th post",  text: "4th post content")
    Post.create(title: "this is the 5th post",  text: "5th post content")
    Post.create(title: "this is the 6th post",  text: "6th post content")
    Post.create(title: "this is the 7th post",  text: "7th post content")

  end
end
