module Response
  class Base
    attr_reader :data, :error
    attr_initialize [:data, :error]
  end
end