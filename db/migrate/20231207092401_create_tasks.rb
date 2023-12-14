class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :task_details
      t.boolean :is_finished, default: false
      t.date :deadline
      t.integer :category_id

      t.timestamps
    end
  end
end
