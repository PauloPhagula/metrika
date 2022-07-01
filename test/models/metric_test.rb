require "test_helper"

class MetricTest < ActiveSupport::TestCase
  test "should prevent saving invalid metrics" do
    metric = Metric.new
    assert_not metric.save
  end

  test "should prevent saving metrics with invalid names" do
    metric = Metric.new(
      timepoint: DateTime.now,
      name: "A name with invalid chars on the name like ? %",
      metric_value: 0
    )
    assert_not metric.save
  end

  test "should prevent saving metrics future dates" do
    metric = Metric.new(
      timepoint: DateTime.now + 1.day,
      name: "A name with invalid valid chars",
      metric_value: 0
    )
    assert_not metric.save
  end
end
