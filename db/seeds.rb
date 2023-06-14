# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# {Customer}.destroy_all
# {InvoiceItem}.destroy_all
# {Invoice}.destroy_all
# {Item}.destroy_all
# {Merchant}.destroy_all
# {Transaction}.destroy_all

Rake::Task["csv_load:all"].invoke
Coupon.create!(status: 1, code: "20off", name: "20 perc off", perc_disc: 20, dollar_disc: 0, kind: 0, merchant_id: 1)
Coupon.create!(status: 1, code: "10off", name: "10 dollers off", perc_disc: 0, dollar_disc: 10, kind: 1, merchant_id: 2)
Coupon.create!(status: 1, code: "15off", name: "15 dollers off", perc_disc: 0, dollar_disc: 15, kind: 1, merchant_id: 3)
Coupon.create!(status: 1, code: "25off", name: "25 dollers off", perc_disc: 0, dollar_disc: 25, kind: 1, merchant_id: 4)
Coupon.create!(status: 0, code: "35off", name: "35 dollers off", perc_disc: 0, dollar_disc: 35, kind: 1, merchant_id: 5)