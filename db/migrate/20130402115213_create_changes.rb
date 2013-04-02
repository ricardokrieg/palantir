class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.integer :user_id
      t.integer :development_id
      t.integer :action_id

      t.timestamps
    end
  end
end
