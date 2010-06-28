class AddCategoryToNovel < ActiveRecord::Migration
  def self.up

    add_column :novels,:category_id,:integer
  end

  def self.down
    remove_column :novels,:category_id,:integer
  end
end
