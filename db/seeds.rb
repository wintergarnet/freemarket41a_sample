# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Item.create(id: 8, user_id: 2, status: '出品中', name: 'Luke', image: open("#{Rails.root}/public/images/test.jpg"), description: 'sample', item_condition: 'sample', ship_from: '北海道', delivery_fee: '出品者負担', pre_date: 'sample', created_at: "2018-11-12 09:00:05", updated_at: "2018-11-12 09:00:05")
Value.create(id: 13, item_id: 8, price: 500,profit: 500, created_at: "2018-11-12 09:00:05", updated_at: "2018-11-12 09:00:05")
