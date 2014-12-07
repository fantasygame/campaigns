module Response
  class Error < Base
    def success?
      false
    end
  end
end