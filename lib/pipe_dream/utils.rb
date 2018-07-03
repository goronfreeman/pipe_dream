module PipeDream
  module Utils
    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def camelize_keys(hash)
      hash.tap do |h|
        affected_keys = h.each_key.select { |key| key.to_s.include?('_') }
        return h if affected_keys.empty?

        camelized_keys = affected_keys.map do |key|
          key.to_s.split('_').map.with_index do |k, index|
            next k if index.zero?
            k.capitalize
          end.join.to_sym
        end

        Hash[affected_keys.zip(camelized_keys)].each do |old, new|
          h[new] = h.delete(old)
        end
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
