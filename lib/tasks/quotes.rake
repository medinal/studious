require 'json'

namespace :quotes do
  desc "Import quotes from json file"
  task import: :environment do
    path = Rails.root + "db/quotes.json"
    file = File.open(path, 'r')
    hash = JSON.parse(file.read)
    hash.each do |quote|
      Quote.create (quote)
    end
  end
end
