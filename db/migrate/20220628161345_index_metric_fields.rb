class IndexMetricFields < ActiveRecord::Migration[7.0]
  def change
    add_index :metrics, :timepoint
    add_index :metrics, :name
  end
end
