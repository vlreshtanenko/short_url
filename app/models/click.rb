class Click < ApplicationRecord
  searchkick

  belongs_to :url, optional: true
end
