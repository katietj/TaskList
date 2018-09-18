class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task
      t.string :description
      t.string :completiondate

      t.timestamps
    end
  end
end
