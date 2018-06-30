require 'pipe_dream/version'
require 'pipe_dream/configuration'
require 'pipe_dream/response'
require 'pipe_dream/result'
require 'pipe_dream/request'
require 'pipe_dream/utils'
require 'pipe_dream/results/base'
require 'pipe_dream/results/channel'
require 'pipe_dream/results/playlist'
require 'pipe_dream/results/video'

module PipeDream
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
