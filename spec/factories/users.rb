require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email                  { Faker::Internet.email }
    f.password               { "12345678" }
    f.password_confirmation  { "12345678"}

  end
end