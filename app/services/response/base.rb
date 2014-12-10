module Response
  class Base
    attr_reader :data, :message
    attr_initialize [:data, :message]
  end
end