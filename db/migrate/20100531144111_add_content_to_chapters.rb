class AddContentToChapters < ActiveRecord::Migration
  def self.up
    add_column :chapters, :content, :text
  end

  def self.down
    remove_column :chapters, :content
  end
end
