class FixNovelDefaultCount < ActiveRecord::Migration
  def self.up
    change_column_default :novels,:click_count,0
    change_column_default :novels,:download_count,0
  end

  def self.down
    change_column_default :novels,:click_count,0
    change_column_default :novels,:download_count,0
  end
end
