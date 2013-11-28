class AddIsExternalUrlToWebpages < ActiveRecord::Migration
  def change
    add_column :webpages, :is_external_url, :boolean
  end
end
