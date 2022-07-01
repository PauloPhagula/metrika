# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
metrics = []

1.upto(30) do |i|
  metrics << {
    timepoint: DateTime.iso8601("2022-06-#{format('%02d', i)}"),
    name: "cpu_usage",
    metric_value: rand(1..100)
  }
end

Metric.create(metrics)
