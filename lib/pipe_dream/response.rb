require 'json'

module PipeDream
  class Response
    def initialize(data)
      @data = JSON.parse(data)
    end

    def kind
      @kind ||= data.fetch('kind')
    end

    def etag
      @etag ||= JSON.parse(data.fetch('etag'))
    end

    def next_page_token
      @next_page_token ||= data.fetch('nextPageToken')
    end

    def region_code
      @region_code ||= data.fetch('regionCode')
    end

    def total_results
      @total_results ||= page_info.fetch('totalResults')
    end

    def results_per_page
      @results_per_page ||= page_info.fetch('resultsPerPage')
    end

    def items
      @items ||= data.fetch('items').map { |item| Result.for(item) }
    end

    private

    attr_reader :data

    def page_info
      @page_info ||= data.fetch('pageInfo')
    end
  end
end
