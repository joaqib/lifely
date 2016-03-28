class AddDatePlanned < ActiveRecord::Migration
  def change
    add_column :tasks, :date_planned, :date
  end
end
