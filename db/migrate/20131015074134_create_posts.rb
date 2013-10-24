class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.has_attached_file :avatar

      t.timestamps
    end
  end
end
