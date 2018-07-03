require_relative 'spec_helper'

describe PipeDream::Response do
  subject do
    file = File.join(File.dirname(__FILE__), 'fixtures', 'search_result.json')
    data = File.open(file).read
    PipeDream::Response.new(data)
  end

  describe '#kind' do
    it 'returns the correct kind' do
      expect(subject.kind).to eq('youtube#searchListResponse')
    end
  end

  describe '#etag' do
    it 'returns a properly formatted etag' do
      expect(subject.etag)
        .to eq("\"DuHzAJ-eQIiCIp7p4ldoVcVAOeY/eyEjZvRSkJHgKdw2a8tXrdRexHE\"")
    end
  end

  describe '#next_page_token' do
    it 'returns a token' do
      expect(subject.next_page_token).to eq('CAQQAA')
    end
  end

  describe '#region_code' do
    it 'returns the correct region' do
      expect(subject.region_code).to eq('US')
    end
  end

  describe '#total_results' do
    it 'returns the correct amount' do
      expect(subject.total_results).to eq(54_507)
    end
  end

  describe '#results_per_page' do
    it 'returns the correct amount' do
      expect(subject.results_per_page).to eq(4)
    end
  end

  describe '#items' do
    it 'returns an array of search results' do
      expect(subject.items.size).to eq(4)
    end
  end
end
