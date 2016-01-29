class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password

      t.timestamps null: false

      t.index :email
    end
  end
end
