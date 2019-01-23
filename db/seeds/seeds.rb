5.times do |i|
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    nickname: Faker::Pokemon.name,
    phonetic_last: Faker::Pokemon.name,
    first_name: Faker::Pokemon.name,
    last_name: Faker::Pokemon.name,
  )
  Item.create(
    user_id: i,
    status: "出品中",
    name: "sample_name #{i}",
    image: open("#{Rails.root}/public/images/test.jpg"),
    description: "sample_discription #{i}",
    item_condition: Faker::Pokemon.name,
    ship_from: "北海道",
    delivery_fee: "出品者負担",
    pre_date: "#{i}日",
  )
end
