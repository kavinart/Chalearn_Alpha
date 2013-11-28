class AddChallengeIdToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :challenge_id, :integer
  end
end
