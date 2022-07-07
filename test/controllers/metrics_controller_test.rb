require "test_helper"

class MetricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metric = metrics(:fix_1)
  end

  test "should get index" do
    get api_v1_metrics_url
    assert_response :success
  end

  test "should create metric" do
    assert_difference("Metric.count") do
      post api_v1_metrics_url,
        params: {metric: {name: @metric.name, timepoint: @metric.timepoint, metric_value: @metric.metric_value}},
        as: :json
    end

    assert_response :created
  end

  test "should show metric" do
    get api_v1_metric_url(@metric)
    assert_response :success
  end
end
