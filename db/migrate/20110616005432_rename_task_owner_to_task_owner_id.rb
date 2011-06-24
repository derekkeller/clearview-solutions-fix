class RenameTaskOwnerToTaskOwnerId < ActiveRecord::Migration
  def self.up
    rename_column :tasks, :task_owner, :task_owner_id
  end

  def self.down
    rename_column :tasks, :task_owner_id, :task_owner
  end
end
