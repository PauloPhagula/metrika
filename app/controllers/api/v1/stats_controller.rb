class Api::V1::StatsController < ApplicationController

  def index
    filter = Filter.new(*filter_params)

    unless filter.valid?
      return render json: {errors: filter.errors},
                    status: 400
    end

    metrics = filter.metric == "all" ? Metric.all : Metric.where(:name => metric)

    stats = metrics.where('timepoint BETWEEN ? AND ?', filter.from, filter.to)
           .group("name, EXTRACT(#{filter.by} FROM timepoint)")
           .select('name', "EXTRACT(#{filter.by} FROM timepoint) as x", 'AVG(metric_value) as y')

    render json: stats
  end

  def filter_params
    params.require([:metric, :from, :to, :by])
  end

  class Filter
    include ActiveModel::Validations

    attr_reader :metric, :from, :to, :by

    validates :metric, :from, :to, :by, presence: true
    validates :from, date: { before: :to }
    validates :to, date: { before_or_equal_to: Proc.new { Time.now } }
    validates :by, inclusion: { in: %w(minute hour day) }

    def initialize(metric, from, to, by)
      @metric = metric
      @from = DateTime.iso8601(from)
      @to = DateTime.iso8601(to)
      @by = by
    end
  end
end
