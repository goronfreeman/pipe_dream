require 'net/http'
require 'uri'

require 'pipe_dream/utils'

module PipeDream
  class Request
    include Utils

    def initialize(search_term, options = {})
      @search_term = search_term
      @api_key     = PipeDream.configuration.api_key
      @options     = camelize_keys(options)
    end

    def get
      Net::HTTP.get(uri)
    end

    private

    attr_reader :search_term, :api_key, :options

    def uri
      URI('https://www.googleapis.com').tap do |uri|
        uri.path  = '/youtube/v3/search'
        uri.query = URI.encode_www_form(params)
      end
    end

    def params
      { part: 'snippet',
        key: api_key,
        q: search_term }.merge(options)
    end
  end
end
