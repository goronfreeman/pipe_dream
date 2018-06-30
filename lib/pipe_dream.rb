require 'pipe_dream/version'
require 'pipe_dream/configuration'
require 'pipe_dream/response'
require 'pipe_dream/request'
require 'pipe_dream/utils'

module PipeDream
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
