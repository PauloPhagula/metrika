class Metric < ApplicationRecord
  validates :name, :timepoint, :metric_value, presence: true
  validates :name, format: {with: /\A(\w)+\z/, message: "only letters, numbers, and underscores allowed"}
  validates :timepoint, date: {before_or_equal_to: proc { Time.now }}
  validates :metric_value, numericality: true
  # NOTE: Could be important to ensure that no two events of the same name are registered at the same time
  # validates :name, uniqueness: { scope: :timepoint, message: 'should be registered once' }
end
