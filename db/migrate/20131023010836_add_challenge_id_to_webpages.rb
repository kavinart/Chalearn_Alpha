class AddChallengeIdToWebpages < ActiveRecord::Migration
  def change
  	add_column :webpages, :challenge_id, :integer
  end
end
