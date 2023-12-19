require "yaml"

module SpecSchemas
  class SchemaLoader
    def initialize(filename)
      @filename = filename
    end

    def load
      YAML.load(
        ERB.new(
          File.read(
            File.join(__dir__, "yaml", "#{@filename}.yaml")
          )
        ).result
      )
    end
  end
end
