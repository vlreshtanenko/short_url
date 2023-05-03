FactoryBot.define do
  factory :url do
    original_url { 'https://example.com/path/to/page' }
    short_url { 'http://localhost:3000/s/95df2898' }
    slug { '95df2898' }
  end
end
