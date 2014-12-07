module Response
  class ActiveModelError < Error

    def initialize(model)
      @error = "Cant persist #{model.class.name}"
      @data = model.errors
    end

  end
end