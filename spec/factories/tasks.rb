require 'faker'

FactoryGirl.define do
  factory :task do |f|
    f.name            { Faker::Hipster.sentence }
    f.hours_planned   { Faker::Number.between(1, 8) }
    f.goal_id         { 1 }

  end
end