module Response
  class Success < Base
    def success?
      true
    end
    def error?
      false
    end
    def flash
      { notice: message }
    end
  end
end