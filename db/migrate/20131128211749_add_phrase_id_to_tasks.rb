class AddPhraseIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :phrase_id, :integer
  end
end
