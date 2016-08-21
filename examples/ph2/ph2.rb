class Ph2
end
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
  DOMAIN_REPOSITORIES = Domain.constants.map do |constant|
    [constant.downcase, Domain.const_get(constant)::Repository]
  end.to_h

  USE_CASES = Domain.constants.flat_map do |domain_module|
    Domain.const_get(domain_module)::UseCases.constants.map do |use_case|
      [ [ domain_module.to_s.underscore.to_sym, use_case.to_s.underscore.to_sym],
        Domain.const_get(domain_module)::UseCases.const_get(use_case)]
    end
  end.to_h

  def initialize(
    database_adapter: Utilities::InMemoryDatabase.new,
    use_cases: USE_CASES)
    @database_adapter = database_adapter
    @use_cases        = use_cases
  end

  def delete_all
    @database_adapter.delete_all
  end

  def run(module_name, command_name, args={})
    @use_cases[[module_name, command_name]].new(
      args: args,
      database_adapter: @database_adapter
    ).call
  end

  def query(module_name, args={})
    @database_adapter[module_name].query args
  end
end
