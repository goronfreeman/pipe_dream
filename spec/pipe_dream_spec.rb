require_relative 'spec_helper'

describe PipeDream do
  describe '.configure' do
    before do
      PipeDream.configure do |config|
        config.api_key = 'abc123'
      end
    end

    it 'returns the API key' do
      expect(PipeDream.configuration.api_key).to eq('abc123')
    end
  end
end
