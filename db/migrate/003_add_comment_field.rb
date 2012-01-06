class AddCommentField < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE Timebanks ADD COLUMN comment char(200)"
    Timebank.reset_column_information
  end
end
