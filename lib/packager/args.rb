module HecksPackager
  # represents the args passed in
  class Args
    attr_reader :method

    def initialize(command_args)
      @domain_module = command_args[0]
      @method        = command_args[1]
      @data          = command_args[2]
    end

    def domain_module
      @domain_module.to_sym
    end

    def data
      json = JSON.parse(@data, symbolize_names: true)

      if(@method == 'delete')
        return json[:id]
      else
        json
      end
    end
  end
end
