class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :state
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false

      t.index :state
      t.index :created_at
    end
  end
end
