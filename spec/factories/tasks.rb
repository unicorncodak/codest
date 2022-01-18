# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Internet.slug }
    priority { Faker::Number.between(from: 1, to: 10) }
    user { 1 }
  end
end
