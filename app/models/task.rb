class Task < ActiveRecord::Base

  validates :task_owner_id, :presence => true
  validates :event_id, :presence => true

  belongs_to :user
  belongs_to :investor
  belongs_to :task_owner, :class_name => "User", :foreign_key => "task_owner_id"

end
