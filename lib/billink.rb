require "rubygems"
require "httpi"
require "hashie"
require "crack/xml"
require "gyoku"
require "logger"

require "billink/helpers"
require "billink/configuration"
require "billink/api/request"
require "billink/api/request/check_request"
require "billink/check"

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
