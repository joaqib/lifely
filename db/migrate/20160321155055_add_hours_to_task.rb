class AddHoursToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :hours_planned, :float, default: 0
  end
end
