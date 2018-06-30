require 'pipe_dream/version'
require 'pipe_dream/configuration'

module PipeDream
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
