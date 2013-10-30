class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    Tag.create name: 'Sports'
    Tag.create name: 'Computer Science'
    Tag.create name: 'Game'
    Tag.create name: 'Travel'
    Tag.create name: 'Grummy'
  end
end
