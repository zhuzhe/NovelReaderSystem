class DeleteIdFromAccountsNovels < ActiveRecord::Migration
  def self.up
    change_table :Accounts_Novels do |t|
      t.remove :id
    end
  end

  def self.down
     change_table :Accounts_Novels do |t|
      t.integer :id
    end
  end
end
