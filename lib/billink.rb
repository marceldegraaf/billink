require "rubygems"
require "httpi"
require "hashie"
require "crack/xml"
require "gyoku"

require "billink/helpers"
require "billink/configuration"

module Billink

  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

end
