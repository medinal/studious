class Institutionportfolio < ApplicationRecord

    enum status: { "unviewed" => 0, "viewed" => 1, "archived" => 2 }

  belongs_to :portfolio
  belongs_to :institution
end
