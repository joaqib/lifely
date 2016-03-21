class AddDoneToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :done, :boolean, default: false
    add_column :tasks, :done, :boolean, default: false
  end
end
