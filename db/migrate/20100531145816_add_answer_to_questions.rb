class AddAnswerToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :answer, :text
  end

  def self.down
    remove_column :questions, :answer
  end
end
