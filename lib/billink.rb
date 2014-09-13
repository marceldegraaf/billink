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
require "billink/api/request/status_request"
require "billink/api/response"
require "billink/api/response/status_response"
require "billink/client"
require "billink/check"
require "billink/order"
require "billink/order_item"
require "billink/delivery_address"
require "billink/status"
require "billink/order_status"
require "billink/hash_extension.rb"

module Billink

  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def log(message)
      logger.log(timestamped_message(message))
    end

    def logger
      @logger ||= Billink::Logger.new(log_path: Billink.configuration.log_path)
    end

    private

    def timestamped_message(message)
      "[#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}] #{message}"
    end
  end

end
