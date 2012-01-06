class CreateTimebanks < ActiveRecord::Migration
  def self.up
    create_table :timebanks do |t|
      t.column :project_id, :integer
      t.column :invoice_id, :integer
      t.column :date_in_effect, :date
      t.column :amount_of_time, :integer
    end
  end

  def self.down
    drop_table :timebanks
  end
end
