@git_repo = "https://github.com/uhhuhyeah/rails3_template"

# Remove unwanted files
run "rm public/index.html"
run "rm public/images/rails.png"
run "rm public/javascripts/rails.js"
run "rm app/views/layouts/application.html.erb"

# Grab standards gems
run "wget --no-check-certificate '#{@git_repo}/raw/master/Gemfile' -O Gemfile"
run "bundle install"

# Load settings
run "wget --no-check-certificate '#{@git_repo}/raw/master/load_settings.rb' -O config/load_settings.rb"
run "wget --no-check-certificate '#{@git_repo}/raw/master/settings.yml' -O config/settings.yml"

# Run generators
run "rails generate jquery:install"
run "rails generate rspec:install"
run "rails generate cucumber:install"
run "rails generate devise:install"
run "rails generate devise User" if?('Generate Devise User?')

# Setup Sass
run "mkdir public/sass"
run "wget --no-check-certificate '#{@git_repo}/raw/master/screen.sass' -O public/stylesheets/sass/screen.sass"
run "wget --no-check-certificate '#{@git_repo}/raw/master/_mixins.sass' -O public/stylesheets/sass/_mixins.sass"

# Download head.js and application layout
run "wget --no-check-certificate '#{@git_repo}/raw/master/head.min.js' -O public/javascripts/head.min.js"
run "wget --no-check-certificate '#{@git_repo}/raw/master/application.html.erb' -O app/views/layouts/application.html.erb"


# git
git :init
git :add => "."
git :commit => "-am 'Initial Commit'"

puts "Done. Now go make it rain!"