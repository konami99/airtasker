class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
