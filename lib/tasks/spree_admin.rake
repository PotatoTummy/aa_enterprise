namespace :spree do
  desc 'Create admin user'
  task create_admin: :environment do
    if Spree::User.joins(:spree_roles).where(spree_roles: { name: 'admin' }).exists?
      puts 'Admin user already exists!'
    else
      admin = Spree::User.new(
        email: 'admin@example.com',
        password: 'spree123',
        password_confirmation: 'spree123'
      )
      if admin.save
        admin.spree_roles << Spree::Role.find_or_create_by!(name: 'admin')
        puts 'Admin user has been created!'
        puts 'Email: admin@example.com'
        puts 'Password: spree123'
      else
        puts 'Could not create admin user:'
        puts admin.errors.full_messages.join("\n")
      end
    end
  end
end 