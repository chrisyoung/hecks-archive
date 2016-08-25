class Ph2
end

require 'pry'
require 'active_support/inflector'
require 'dry-validation'
file_path = File.dirname(__FILE__)
require file_path + '/lib/domain.rb'

Dir[file_path + '/' + "lib/utilities/**/*.rb"].each { |file| require file }

# Convenience class for calling use cases.  The #[] method will look up any
# usecase and run it by passing args and a repositories container.
#
# Ph2.new[:some_use_case, arg1: arg1, arg2: arg:2]
#
# You can pass in repositories using the initializer if you want to use
# something other than the default domain repos
class Ph2
  def initialize(
    database_adapter: Utilities::InMemoryDatabase.new)
    @database_adapter = database_adapter
  end

  def delete_all
    @database_adapter.delete_all
  end

  def run(module_name, command_name, args={})
    Domain.use_cases[[module_name, command_name]].new(
      args: args,
      database_adapter: @database_adapter
    ).call
  end

  def query(module_name, args={})
    @database_adapter[module_name].query args
  end
end
