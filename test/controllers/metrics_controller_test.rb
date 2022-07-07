require "test_helper"

class MetricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metric = metrics(:fix_1)
  end

  test "should get index" do
    get api_v1_metrics_url
    assert_response :success
  end

  test "should fail to create a metric with invalid name" do
    post api_v1_metrics_url,
      params: {metric: {name: "%", timepoint: DateTime.now.end_of_day, metric_value: @metric.metric_value}},
      as: :json

    assert_response :unprocessable_entity
  end

  test "should fail to create a metric with invalid value" do
    post api_v1_metrics_url,
      params: {metric: {name: @metric.name, timepoint: DateTime.now.end_of_day, metric_value: -1}},
      as: :json

    assert_response :unprocessable_entity
  end

  test "should fail to create a metric in the future" do
    post api_v1_metrics_url,
      params: {metric: {name: @metric.name, timepoint: DateTime.now.end_of_day, metric_value: @metric.metric_value}},
      as: :json

    assert_response :unprocessable_entity
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
