class Api::V1::MetricsController < ApplicationController
  before_action :set_metric, only: %i[show]

  # GET /metric_names
  def names
    @distinct_metric_names = Metric.distinct.pluck(:name)
    render json: @distinct_metric_names
  end

  # GET /metrics
  def index
    @metrics = Metric.all

    render json: @metrics
  end

  # GET /metrics/1
  def show
    render json: @metric
  end

  # POST /metrics
  def create
    @metric = Metric.new(metric_params)

    if @metric.save
      render json: @metric, status: :created
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_metric
    @metric = Metric.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def metric_params
    params.require(:metric).permit(:timepoint, :name, :metric_value)
  end
end
