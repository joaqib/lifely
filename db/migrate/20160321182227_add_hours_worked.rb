class AddHoursWorked < ActiveRecord::Migration
  def change
    add_column :tasks, :hours_worked, :float, default: 0
  end
end
