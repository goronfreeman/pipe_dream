module PipeDream
  module Result
    class Video < Base
      def id
        @id ||= super('videoId')
      end

      def url
        @url ||= super('/watch', v: id)
      end
    end
  end
end
