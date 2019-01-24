3.times do |i|
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    nickname: Faker::Pokemon.name,
    phonetic_last: Faker::Pokemon.name,
    first_name: Faker::Pokemon.name,
    last_name: Faker::Pokemon.name,
  )
  Item.create(
    user_id: 1,
    status: "exhibition",
    name: "sample_name",
    image: open("#{Rails.root}/public/images/test.jpg"),
    description: "sample_discription",
    item_condition: "newer",
    ship_from: "北海道",
    delivery_fee: "出品者負担",
    pre_date: "2~3日",
  )
  # Value.create(
  #   item_id: "#{i}",
  #   price:
  # )
end
