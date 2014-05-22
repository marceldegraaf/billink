module Billink
  class Logger
    include Billink::Helpers::AttributeAssignment

    attr_reader :log_path, :log_level

    def log(message)
      logger.send(log_level, message)
    end

    private

    def logger
      @logger ||= Logger.new(log_path)
    end

  end
end
