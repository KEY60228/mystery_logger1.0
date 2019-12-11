class AddPerformanceIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :performance_id, :integer
  end
end
