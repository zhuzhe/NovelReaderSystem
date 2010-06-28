class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :content
      t.integer :account_id
      t.integer :novel_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
