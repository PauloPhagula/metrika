class Api::V1::MetricsController < ApplicationController
  before_action :set_metric, only: %i[ show update destroy ]

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
    render json: @book
  end

  # POST /metrics
  def create
    @metric = Metric.new(metric_params)

    if @metric.save
      render json @metric, status: :created, location: @metric
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /metrics/1
  def update
    if @metric.update(metric_params)
      render json: @metric
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  # DELETE /metrics/1
  def destroy
    @metric.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric
      @metric = Metric.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def metric_params
      params.require(:metric).permit(:time, :name, :value)
    end
end