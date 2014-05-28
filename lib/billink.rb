require "rubygems"
require "httpi"
require "hashie"
require "crack/xml"
require "gyoku"
require "logger"

require "billink/helpers"
require "billink/logger"
require "billink/configuration"
require "billink/api/request"
require "billink/api/request/check_request"
require "billink/api/request/order_request"
require "billink/api/response"
require "billink/client"
require "billink/check"
require "billink/order"
require "billink/order_item"
require "billink/delivery_address"

module Billink

  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def log(message)
      logger.log(message)
    end

    def logger
      @logger ||= Billink::Logger.new(log_path: Billink.configuration.log_path)
    end
  end

end
