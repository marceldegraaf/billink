module Billink
  class Logger
    include Billink::Helpers::AttributeAssignment

    def log(message, log_level = nil)
      log_level ||= Billink.configuration.log_level
      logger.send(log_level, message)
    end

    private

    def logger
      @logger ||= ::Logger.new(Billink.configuration.log_path)
    end

  end
end
