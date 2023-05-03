require 'rails_helper'

RSpec.describe ShortUrls::CreateService do
  let(:url_class) { Url }

  let(:params) do
    {
      original_url: 'https://example.com/path/to/page',
      host: 'http://localhost:3000',
      slug: '95df2898'
    }
  end

  subject(:instance) { described_class.new(params) }

  describe '#call' do
    it 'returns url record' do
      expect(instance.call).to be_a(url_class)
    end

    context 'when valid params' do
      subject { instance.call }

      let(:url_attrs) do
        {
          original_url: params[:original_url],
          short_url: params[:host] + '/s/' + params[:slug],
          slug: params[:slug]
        }
      end

      it 'has required attributes' do
        expect(instance.call).to have_attributes(original_url: url_attrs[:original_url],
                                                 short_url: url_attrs[:short_url],
                                                 slug: url_attrs[:slug])
      end
    end
  end
end
