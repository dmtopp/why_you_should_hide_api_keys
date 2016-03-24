require 'bundler'
Bundler.require

# time to be a hero and get secrets
# including the dotenv gem gives us access
# to a special system HASH called ENV

# the dotenv library to load the .env file
Dotenv.load

# output

puts Rainbow(ENV).cyan
puts Rainbow(ENV["API_KEY"]).magenta
puts Rainbow(ENV["VERSION"]).red.italic
puts Rainbow(ENV["APP_NAME"]).yellow.inverse

def show_secrets
  p ENV.length.to_s + " is the length of ENV"
  ENV.each do |secret|
    puts Rainbow(secret).aqua
  end
end

show_secrets

def git_movie
  p HTTParty.get('http://www.omdbapi.com/' + ENV['MOVIE'])
end

git_movie
