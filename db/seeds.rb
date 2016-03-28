# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! email: "jo.ib.pm@gmail.com", password: "12345678", password_confirmation: "12345678"

Goal.create(name: "Learn English", user_id: 1)
  6.times do |i|
    Task.create(name: "Learn English #{i}",
              goal_id: 1,
              date_planned: (Date.today - (3 * i +1)).to_time,
              done: true,
              hours_planned: rand(1..5),
              hours_worked: rand(1..5) )
    end

  2.times do |i|
    Task.create(name: "Learn English future #{i}",
              goal_id: 1,
              date_planned: (Date.today + (1 * i)).to_time,
              done: false,
              hours_planned: rand(1..5) )
  end


Goal.create(name: "Get Healthy", user_id: 1)
  6.times do |i|
    Task.create(name: "Get Healthy #{i}",
              goal_id: 2,
              date_planned: (Date.today - (4 * i)).to_time,
              done: true,
              hours_planned: rand(1..5),
              hours_worked: rand(1..5) )
    end
  2.times do |i|
    Task.create(name: "Get Healthy future #{i}",
              goal_id: 2,
              date_planned: (Date.today + (1 * i)).to_time,
              done: false,
              hours_planned: rand(1..5) )
  end


Goal.create(name: "Backpack Business", user_id: 1)
    6.times do |i|
      Task.create(name: "Backpack Business #{i}",
                goal_id: 3,
                date_planned: (Date.today - (2 * i)).to_time,
                done: true,
                hours_planned: rand(1..5),
                hours_worked: rand(1..5) )
      end
    2.times do |i|
      Task.create(name: "Backpack Business future #{i}",
              goal_id: 3,
              date_planned: (Date.today + (1 * i)).to_time,
              done: false,
              hours_planned: rand(1..5) )
  end
