class AddUrlToWebpages < ActiveRecord::Migration
  def change
    add_column :webpages, :url, :string
  end
end
