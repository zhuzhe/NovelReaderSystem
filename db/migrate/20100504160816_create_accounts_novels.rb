class CreateAccountsNovels < ActiveRecord::Migration
  def self.up
    create_table :accounts_novels do |t|
      t.references :account
      t.references :novel
      t.timestamps
    end
  end

  def self.down
    drop_table accounts_novels
  end
end
