# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

class Seed

  def self.call
    Seed.new.call
  end

  def call
    generate_first_idea
    generate_ideas
    print_ideas
  end

  def generate_first_idea
    title = "Do all the things"
    blah = ""
    100.times {blah += 'blah '}
    body = "each one needs doing, #{blah} "
    Idea.create(title: title, body: body, status: 1)
  end

  def generate_ideas
    14.times do |i|
      title = "#{Faker::Hacker.verb} #{Faker::Hacker.noun}".capitalize
      body = Faker::Hacker.say_something_smart
      Idea.create(title: title, body: body, status: rand(3))
    end
  end

  def print_ideas
    ideas = Idea.all
    (Idea.count - 1).times do |i|
      iteration = (i + 1)
      title = ideas[iteration].title
      puts "#{iteration}: Idea #{title} created!"
    end
  end
end

Seed.call
