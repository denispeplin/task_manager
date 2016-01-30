class CreateTaskFiles < ActiveRecord::Migration
  def change
    create_table :task_files do |t|
      t.attachment :attachment
      t.references :task, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
