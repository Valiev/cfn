# Example:
#
# output "ChefServerIP" do
#   value "10.123.123.123"
#   description "IP for newly created Chef server"
# end

module CFN
  class Output
    def initialize(name, &block)
      @name = name
      @value = nil
      @description = nil
      self.instance_exec &block if block_given?
    end

    def value v
      @value ||= v
    end

    def description desc
      @description ||= desc
    end

    def to_s
      "Output '#{@name}'\n\tvalue: '#{@value}''\n\tdecs: '#{@description}'"
    end

    def to_json
      require 'json'
      {
        @name => {
          Value: @value,
          Description: @description
        }
      }.to_json
    end
  end
end

def output(name, &block)
  CFN::Output.new(name, &block)
end
