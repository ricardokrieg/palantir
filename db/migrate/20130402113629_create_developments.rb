class CreateDevelopments < ActiveRecord::Migration
  def change
    create_table :developments do |t|
      t.integer :user_id
      t.integer :site_id
      t.integer :category_id

      t.timestamps
    end
  end
end
