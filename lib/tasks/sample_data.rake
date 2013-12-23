namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@modelvine.com"
      password  = "passwordlong"
      model = Model.create
      u = User.create!(name: name,
                   email: email,
                   approved: true,
                   password: password,
                   password_confirmation: password)
      u.user_type_type = "Model"
      u.user_type_id = model.id
      u.save
    end
  end
end