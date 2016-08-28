## Start Documenting API

### Modules:

```
#### Your Domain is the root hexagon
PizzaServer

#### Hecks modules are equivalent to DDD aggregates
PizzaServer::Pizzas

#### Invariants are declarative and are returned by command objects.  They can
#### easilly be used as a documentatoin to build validations.  You can use the
PizzaServer::Pizzas::Invariants

#### Commands

#### Commands are equivalent to a hexagonal "driver" port, they are the application
#### ring and are generaly intended to be used create clients for your Hexagon.
PizzaServer::Pizzas::Commands::Create
PizzaServer::Pizzas::Commands::Update
PizzaServer::Pizzas::Commands::Delete

#### Queries
PizzaServer::Pizzas::Queries::PizzaByID
PizzaServer::Pizzas::Queries::Pizzas

#### Drivers (Equivalent to Hexagonal "left port" or "driver port")
PizzaServer::Drivers::HTTP
PizzaServer::Drivers::JSON

#### Clients (Equivalent to hexagonal "right port" or "driven port")
PizzaServer::Repositories::SQL
PizzaServer::Repositories::CouchBase
#### Example
```