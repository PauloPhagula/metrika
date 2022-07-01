# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Metric.create([
  {timepoint: DateTime.iso8601("2022-06-26"),
   name: "ram",
   metric_value: 10},
  {timepoint: DateTime.iso8601("2022-06-27"),
   name: "ram",
   metric_value: 10}
])
