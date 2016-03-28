require 'faker'

FactoryGirl.define do
  factory :goal do |f|
    f.name         { Faker::Commerce.product_name }
    f.user_id      { 1 }
    
  end
end