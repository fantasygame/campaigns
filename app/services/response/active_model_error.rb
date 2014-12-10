module Response
  class ActiveModelError < Error

    def initialize(model)
      @message = "Cant persist #{model.class.name}"
      @data = model.errors
    end

  end
end