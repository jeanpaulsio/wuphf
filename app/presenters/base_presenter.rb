class BasePresenter
  def initialize(object, template)
    @object   = object
    @template = template
  end

  private
    def self.presents(name)
      define_method(name) do
        @object
      end
    end

    def h
      @template
    end

    # this let's us not have to use the `h` call
    def method_missing(*args, &block)
      @template.send(*args, &block)
    end
end
