namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    business = Business.create
    User.create!(name: "Thomas Surgent",
                 email: "surgentt@gmail.com",
                 password: "password123",
                 password_confirmation: "password123",
                 zip_code: 19333,
                 admin: true,
                 approved: true)
    User.create!(name: "Jinru Wu",
                 email: "woodbleak@gmail.com",
                 password: "password123",
                 password_confirmation: "password123",
                 zip_code: 11219,
                 admin: true,
                 approved: true)
    99.times do |n|
      name  = Faker::Name.name
      zip_code = Faker::Address.zip_code
      email = "example-#{n+1}@modelvine.com"
      password  = "password123"
      model = Model.create
      u = User.create!(name: name,
                   email: email,
                   approved: true,
                   password: password,
                   password_confirmation: password,
                   zip_code: zip_code)
      u.user_type_type = "Model"
      u.user_type_id = model.id
      u.save
      user_photo = u.user_photos.new
      user_photo.photo = File.open(Dir.glob(File.join(Rails.root, 'public', 'sample_images','*')).sample)
      user_photo.save
    end
  end
end