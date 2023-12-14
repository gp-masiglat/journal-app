class Category < ApplicationRecord
    has_many :task, dependent: :destroy
    belongs_to :user

    
    validates :category_name, presence: true, uniqueness: true
    validates :category_details, :user_id, presence: true

    def task_count
        task.count
    end

end
