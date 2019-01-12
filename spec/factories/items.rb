FactoryBot.define do
  factory :item do
    status          "sample_status"
    name            "sample_name"
    image File.open("#{Rails.root}/public/images/test.jpg")
    description     "sample_description"
    item_condition  "sample_item_condition"
    ship_from       "sample_ship_from"
    delivery_fee    "sample_delivery_fee"
    pre_date        "sample_pre_date"
  end
end
