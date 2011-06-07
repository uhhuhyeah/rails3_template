@git_repo = "https://raw.github.com/uhhuhyeah/rails3_template"

# Remove unwanted files
run "rm public/index.html"
run "rm public/images/rails.png"
run "rm public/javascripts/rails.js"
run "rm app/views/layouts/application.html.erb"

# Grab standards gems
run "curl -O #{@git_repo}/master/Gemfile"
run "bundle install"

# Load settings
inside('config') do
  run "curl -O #{@git_repo}/master/load_settings.rb"
  run "curl -O #{@git_repo}/master/settings.yml"
end

# Run generators
run "rails generate jquery:install"
run "rails generate rspec:install"
run "rails generate cucumber:install"
run "rails generate devise:install"
puts "\n"
run "rails generate devise User" if yes?("Generate Devise User?\n: ")

# Setup Sass
run "mkdir -p public/stylesheets/sass"
inside('public/stylesheets/sass') do
  run "curl -O #{@git_repo}/master/screen.sass"
  run "curl -O #{@git_repo}/master/_mixins.sass"
end

# Download head.js and application layout
inside('public/javascripts') do
  run "curl -O #{@git_repo}/master/head.min.js"
end
inside('app/views/layouts') do
  run "curl -O #{@git_repo}/master/application.html.erb"
end

# Setup db
rake "db:create"
rake "db:migrate"
rake "db:test:prepare"

# Setup home page
generate :controller, "welcome index" 
route "root :to => 'welcome#index'"

# git
git :init
git :add => "."
git :commit => "-am 'Initial Commit'"

puts "\n"
puts "Template Tasks Complete"
puts "Now go make it rain!"
puts "\n"