require "test_helper"

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should reject getting stats with invalid avg filter" do
    get api_v1_stats_url,
      params: {metric: "all", by: "eon", from: DateTime.now, to: DateTime.now.beginning_of_day},
      as: :json
    assert_response :bad_request
  end

  test "should reject getting stats with invalid time filter" do
    get api_v1_stats_url,
      params: {metric: "all", by: "minute", from: DateTime.now, to: DateTime.now.beginning_of_day},
      as: :json
    assert_response :bad_request
  end

  test "should get stats for all metrics" do
    get api_v1_stats_url,
      params: {metric: "all", by: "minute", from: DateTime.now.beginning_of_day, to: DateTime.now},
      as: :json
    assert_response :success
  end

  test "should get stats for a specific metric" do
    get api_v1_stats_url,
      params: {metric: "MyString", by: "minute", from: DateTime.now.beginning_of_day, to: DateTime.now},
      as: :json
    assert_response :success
  end
end
