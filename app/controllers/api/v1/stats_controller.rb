class Api::V1::StatsController < ApplicationController
  def index

    metric = params[:metric]
    if metric.nil? or metric == "all"
      metrics = Metric.all
    else
      metrics = Metric.where(:name => metric)
    end

    by = params[:by]
    unless ["minute", "hour", "day"].include?(by)
      raise("Invalid grouping")
    end

    from = DateTime.iso8601(params[:from])
    to = DateTime.iso8601(params[:to])


    # SELECT name, EXTRACT(day FROM timepoint) as x, avg(metric_value) as y
    # FROM metrics
    # WHERE name IN ("cpu_usage")
    #   AND timepoint BETWEEN '2022-06-26' AND '2022-06-29'
    # GROUP BY name, EXTRACT(day FROM timepoint);
    stats = metrics.where('timepoint BETWEEN ? AND ?', from, to)
           .group("name, EXTRACT(#{by} FROM timepoint)")
           .select('name', "EXTRACT(#{by} FROM timepoint) as x", 'AVG(metric_value) as y')

    render json: stats
  end
end
