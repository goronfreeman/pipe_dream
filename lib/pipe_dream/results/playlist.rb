module PipeDream
  module Result
    class Playlist < Base
      def id
        @id ||= super('playlistId')
      end

      def url
        @url ||= super('/playlist', list: id)
      end
    end
  end
end
