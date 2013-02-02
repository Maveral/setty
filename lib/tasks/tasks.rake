task :slugs => :environment do
  User.find_each(&:save)
end