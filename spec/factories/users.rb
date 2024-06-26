FactoryBot.define do
  factory :user, aliases: [:author, :owner, :sender, :recipient, :member] do
    email { Faker::Internet.email }
    username { Faker::Name.first_name + rand(0..99).to_s }
    password { Faker::Internet.password }
  end
end
