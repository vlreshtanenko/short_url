require 'rails_helper'

RSpec.describe ShortUrls::FindService do
  let(:url_class) { Url }
  let!(:expected_url) do
    create(:url, original_url: 'https://example.com/path/to/page',
                 short_url: 'http://localhost:3000/s/95df2898',
                 slug: '95df2898')
  end

  let(:params) do
    {
      slug: '95df2898'
    }
  end

  subject(:instance) { described_class.new(params) }

  describe '#call' do
    subject(:method_call) { instance.call }

    it { is_expected.to eq(expected_url) }
  end
end
