class CreateDones < ActiveRecord::Migration[5.2]
  def change
    create_table :dones do |t|
      t.integer :performance_id
      t.integer :user_id

      t.timestamps
    end
  end
end
