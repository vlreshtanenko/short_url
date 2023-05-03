class Url < ApplicationRecord
  searchkick

  validates :original_url, presence: true
  validates_format_of :original_url, with: /^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$/, :multiline => true

  has_many :clicks
end
