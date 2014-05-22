module Billink
  class Configuration
    include Billink::Helpers::AttributeAssignment

    attr_accessor :user_id, :user_name, :workflow_id, :test_mode, :debug_mode, :log_path, :log_level

    def debug_mode=(boolean)
      @debug_mode = boolean

      if boolean == true
        HTTPI.log = true
        HTTPI.log_level = :debug
      else
        HTTPI.log = false
      end
    end

    def debug_mode?
      debug_mode == true
    end

    def test_mode?
      test_mode == true
    end

    def log_path
      @log_path || "billink.log"
    end

    def log_level
      @log_level || :info
    end

    def logger
      @logger ||= Billink::Logger.new(log_path: log_path, log_level: log_level)
    end

  end
end
