module Response
  class Error < Base
    def success?
      false
    end

    def error?
      true
    end

    def flash
      { alert: message }
    end
  end
end
