class MakeAmountOfTimeDecimal < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE Timebanks ALTER COLUMN amount_of_time TYPE numeric(7,2)"
    Timebank.reset_column_information
  end
end
