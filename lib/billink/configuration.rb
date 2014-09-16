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
        HTTPI.log_level = :info
        HTTPI.log = false
      end
    end

    def customer_type=(symbol)
      case symbol
        when :business; @type_code = "B"
        when :consumer; @type_code = "P"
        else @type_code = default_type_code
      end
    end

    def type_code
      @type_code ||= default_type_code
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

    private

    def default_type_code
      "P"
    end

  end
end
