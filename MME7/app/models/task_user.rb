class TaskUser < ActiveRecord::Base
   attr_accessible :task_id, :user_id , :assigned
belongs_to :task
belongs_to :user

end
