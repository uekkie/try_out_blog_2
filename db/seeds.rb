
# factory users
if User.count < 20 then
  1..20.times do
    email = Faker::Internet.email
    user = User.new(
      email: email,
      name: email.split('@').first.delete('._'),
      password: 'password',
      password_confirmation: 'password',
    )
    p user.name
    unless user.save
      p user.errors
    end
  end
end


if Post.count < 100 then
  user_ids = User.pluck(:id)
  1..100.times do
    Post.create!(
      content: Faker::Lorem.sentence,
      user_id: user_ids.sample
    )
  end
end
