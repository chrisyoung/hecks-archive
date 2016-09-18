require_relative "../lib/generators/resource_server"
require_relative "../lib/generators/crud_commands"
require_relative "../lib/generators/value_object"
require_relative "../lib/generators/aggregate"

class Generate < Thor
  package_name "hecks generate"

  register(
    Domain::Aggregate,
    "aggregate",
    "aggregate NAME -h NAME -a [ATTRIBUTE:TYPE]",
    "Creates a module with an aggregate head, a repository and application"
  )

  register(
    Domain::ValueObject,
    "value_object",
    "value_object NAME -m NAME -a [ATTRIBUTES:TYPE]",
    "Add a value object to a module"
  )

  register(
    Adapter::CrudCommands,
    "crud_commands",
    "crud_commands -m MODULE_NAME",
    "generate a crud commands for a module"
  )

  register(
    Adapter::ResourceServer,
    "resource_server",
    "resource_server",
    "generate a CRUD Server"
  )
end
