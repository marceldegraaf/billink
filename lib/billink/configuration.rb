module Billink
  class Configuration
    include Billink::Helpers::AttributeAssignment

    attr_accessor :user_id, :workflow_id, :test_mode, :debug_mode

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

  end
end
