class Project < ApplicationRecord

  enum staus: [:draft, :published, :archived]

  belongs_to :user

end
