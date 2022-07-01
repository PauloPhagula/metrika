class ChangeValueTypeToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :metrics, :metric_value, :float
  end
end
