class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.string :image_name
      t.text :contents

      t.timestamps
    end
  end
end
