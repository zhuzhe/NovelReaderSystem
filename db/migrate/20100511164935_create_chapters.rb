class CreateChapters < ActiveRecord::Migration
  def self.up
    create_table :chapters do |t|
      t.string :name
      t.string :url
      t.integer :novel_id
      t.timestamps
    end
  end

  def self.down
    drop_table :chapters
  end
end
