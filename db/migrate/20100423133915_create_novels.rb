class CreateNovels < ActiveRecord::Migration
  def self.up
    create_table :novels do |t|
      t.text :name
      t.string :writer
      t.string :url
      t.integer :click_count
      t.integer :download_count
      
      t.timestamps
    end
  end

  def self.down
    drop_table :novels
  end
end
