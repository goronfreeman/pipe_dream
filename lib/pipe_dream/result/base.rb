module PipeDream
  module Result
    def self.for(item)
      case item.dig('id', 'kind')
      when 'youtube#channel'
        Channel
      when 'youtube#playlist'
        Playlist
      when 'youtube#video'
        Video
      end.new(item)
    end

    class Base

    end
  end
end
