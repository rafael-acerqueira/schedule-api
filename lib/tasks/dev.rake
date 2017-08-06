namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    puts "Reset database..."

    %x(rails db:drop db:create db:migrate)

    puts "Creating kinds..."

    kinds = %w(Friend Business Acquaintance)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Kinds created!"

    ######################

    puts "Creating contacts..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts "Creating contacts!"

  end
end
