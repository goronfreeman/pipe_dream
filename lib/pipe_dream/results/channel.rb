module PipeDream
  module Result
    class Channel < Base
      def id
        @id ||= super('channelId')
      end

      def url
        @url ||= super("/channel/#{id}")
      end
    end
  end
end
