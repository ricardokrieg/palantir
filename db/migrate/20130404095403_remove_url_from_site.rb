class RemoveUrlFromSite < ActiveRecord::Migration
  def change
    remove_column :sites, :url, :string
  end
end
