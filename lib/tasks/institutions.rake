require 'csv'

namespace :institution do
  desc "Import institutions from csv file"
  task import: :environment do
    path = Rails.root + "db/institutions.csv"
    CSV.foreach(path, :headers => true) do |row|
      Institution.create ({
                             :name => row[0],
                             :address => row[1],
                             :city=> row[2],
                             :state => row[3],
                             :zip => row[4],
                             :url => row[5]
                           })
    end
  end
end
