class Url < ApplicationRecord
  searchkick

  belongs_to :clicks, optional: true
end
