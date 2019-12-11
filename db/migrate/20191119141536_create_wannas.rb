class CreateWannas < ActiveRecord::Migration[5.2]
  def change
    create_table :wannas do |t|
      t.integer :performance_id
      t.integer :user_id

      t.timestamps
    end
  end
end
