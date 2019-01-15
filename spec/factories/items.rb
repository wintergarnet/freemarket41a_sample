FactoryBot.define do
  factory :item do
    status          {Faker::Pokemon.move}
    name            {Faker::OnePiece.akuma_no_mi}
    image {File.open("#{Rails.root}/public/images/test.jpg")}
    description     {Faker::OnePiece.quote}
    item_condition  {Faker::OnePiece.sea}
    ship_from       {Faker::OnePiece.location}
    delivery_fee    {Faker::Pokemon.name}
    pre_date        {Faker::OnePiece.island}
    user
  end

  factory :item_with_value, class: Item do
    status          {Faker::Pokemon.move}
    name            {Faker::OnePiece.akuma_no_mi}
    image {File.open("#{Rails.root}/public/images/test.jpg")}
    description     {Faker::OnePiece.quote}
    item_condition  {Faker::OnePiece.sea}
    ship_from       {Faker::OnePiece.location}
    delivery_fee    {Faker::Pokemon.name}
    pre_date        {Faker::OnePiece.island}
    user

    after( :create) do |item|
      create :value, item: item
    end
  end
end
