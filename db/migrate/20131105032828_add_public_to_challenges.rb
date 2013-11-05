class AddPublicToChallenges < ActiveRecord::Migration
  def change
  	add_column :challenges, :public, :bit
  end
end
