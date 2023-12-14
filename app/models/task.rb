class Task < ApplicationRecord
    belongs_to :category

    
    validates :task_name, presence: true, uniqueness: true
    validates :task_details, :category_id, :deadline, presence: true

end
