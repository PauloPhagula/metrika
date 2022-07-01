require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test 'should get stats' do
    get api_v1_stats_url,
        params: {metric: "all", by: "minute", from: DateTime.now.beginning_of_day, to: DateTime.now },
        as: :json
    assert_response :success
  end
end
