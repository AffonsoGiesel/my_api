require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all

users = []
3.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
  user.save!(validate: false)
  users << user
end

posts = []
3.times do
  posts << Post.create!(
    title: Faker::Book.title,
    text: Faker::Lorem.paragraph,
    user: users.sample
  )
end

3.times do
  Comment.create!(
    name: Faker::Name.name,
    comment: Faker::Lorem.sentence,
    post: posts.sample
  )
end

puts "Dados criados com sucesso!"
