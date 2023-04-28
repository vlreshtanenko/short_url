class Click < ApplicationRecord
  searchkick

  has_one :url, optional: true
end
