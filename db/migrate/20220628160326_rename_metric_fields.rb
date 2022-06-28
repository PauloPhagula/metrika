class IndexTimePoints < ActiveRecord::Migration[7.0]
  def change
    rename_column :metrics, :time, :timepoint
    rename_column :metrics, :value, :metric_value
  end
end
