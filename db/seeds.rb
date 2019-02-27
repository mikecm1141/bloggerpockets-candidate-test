# frozen_string_literal: true

100.times do
  user = User.create!(name: Faker::Name.name,
                      email: Faker::Internet.email,
                      password: Faker::Internet.password(8))

  3.times do
    Post.create!(title: Faker::Lorem.sentence.gsub(/\./, ""),
                 body: Faker::Lorem.paragraph,
                 user: user,
                 published: true)
  end
end
