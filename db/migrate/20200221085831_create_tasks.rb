class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :completed_date
      t.references :user, null: false, foreign_key: true
      t.integer :priority, null: false, default: 1

      t.timestamps
    end
  end
end
