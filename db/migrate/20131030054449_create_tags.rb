class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    names = %w[Sports Computer-Science Game Travel Grummy Rails Festival BPS Japan Food Fishing HTML5 Facebook]
    names.each do |name|
      Tag.create name: name
    end
  end
end
