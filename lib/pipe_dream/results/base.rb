module PipeDream
  module Result
    class Base
      def initialize(data)
        @data = data
      end

      def published_at
        @published_at ||= snippet.fetch('publishedAt')
      end

      def channel_id
        @channel_id ||= snippet.fetch('channelId')
      end

      def title
        @title ||= snippet.fetch('title')
      end

      def description
        @description ||= snippet.fetch('description')
      end

      # TODO: Add thumbnail dimension info?
      def thumbnail_url(size = :small)
        @thumbnail_url ||=
          snippet.dig('thumbnails', size_mappings.fetch(size, 'default'), 'url')
      end

      def channel_title
        @channel_title ||= snippet.fetch('channelTitle')
      end

      def live_broadcast_content
        @live_broadcast_content ||= snippet.fetch('liveBroadcastContent')
      end

      alias created_at published_at

      private

      attr_reader :data

      def snippet
        @snippet = data.fetch('snippet')
      end

      def size_mappings
        { small: 'default',
          medium: 'medium',
          large: 'high' }
      end

      def id(key)
        data.dig('id', key)
      end

      def url(path, params = {})
        URI('https://www.youtube.com').tap do |uri|
          uri.path = path
          uri.query = URI.encode_www_form(params)
        end.to_s
      end
    end
  end
end
