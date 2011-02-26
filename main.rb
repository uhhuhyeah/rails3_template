@git_repo = "https://github.com/uhhuhyeah/rails3_template"

run "rm public/index.html"
run "rm public/images/rails.png"
run "wget --no-check-certificate '#{@git_repo}/raw/master/Gemfile' -O Gemfile"
run "bundle install"

run "wget --no-check-certificate '#{@git_repo}/raw/master/load_settings.rb' -O config/load_settings.rb"
run "wget --no-check-certificate '#{@git_repo}/raw/master/settings.yml' -O config/settings.yml"
