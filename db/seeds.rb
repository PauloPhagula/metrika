# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def zero_pad(str)
  format("%02d", str)
end

metrics = []

# TODO: Use previous month, rather than a fixed year and month
1.upto(30) do |i|
  metrics << {
    timepoint: DateTime.iso8601("2022-06-#{zero_pad(i)}T#{zero_pad(rand(0..23))}:#{zero_pad(rand(0..59))}:00"),
    name: "cpu_usage",
    metric_value: rand(1..100)
  }
end

Metric.create(metrics)
