3.times do |i|
  Item.create(
    user_id: 1,
    status: "出品中",
    name: "sample_name #{i}",
    image: open("#{Rails.root}/public/images/test.jpg"),
    description: "sample_discription #{i}",
    item_condition: "新品",
    ship_from: "北海道",
    delivery_fee: "出品者負担",
    pre_date: "#{i}日",
  )
end
