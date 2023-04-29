class Url < ApplicationRecord
  searchkick

  has_many :clicks
end
