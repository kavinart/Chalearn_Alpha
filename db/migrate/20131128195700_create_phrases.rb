class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :label
      t.datetime :start_date
      t.datetime :end_date
      t.integer :submissions_per_day
      t.string :task_averaging
      t.integer :numeric_format
      t.integer :max_submissions

      t.timestamps
    end
  end
end
