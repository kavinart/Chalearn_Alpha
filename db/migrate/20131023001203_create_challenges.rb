class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.text :yamlformat

      t.timestamps
    end
  end
end
