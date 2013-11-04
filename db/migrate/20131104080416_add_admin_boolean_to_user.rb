class AddAdminBooleanToUser < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :bit
  end
end
