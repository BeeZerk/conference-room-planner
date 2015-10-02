1000.times.each do
  pw = Faker::Internet.password
  User.create!(
      email: Faker::Internet.email,
      password: pw,
      password_confirmation: pw,
      username: Faker::Internet.user_name,
      active: true,
      admin: false,
  )
end