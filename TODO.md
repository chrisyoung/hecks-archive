## In Progress
* Fix server

## Current Sprint
* Move schema validation to hexagon
* Update existing generators
* Generate Notifiers
* Generate Validators
* Generate Active Record
* Update the generators
* Hook up code coverage
* Use invariants (fail)
* Get MySQL Running in in Rails
* Stop putting entire hecks directory into container
* Generate Schema

## Next Actions
* Pizza Hexagon Binary
* hecks build -m pizzas
* Build gems command
* We are referencing PizzaHexagon::App, instead of PizzaHexagon
* 12 factor app in Docker
* Products Domain
* JSON schema for building Domain
* CouchDB Persistence Adapter
* Demonstrate Hexagon Shims
* Rename use cases to commands
* Generator to create config.ru file
* Server gem
* Set up stats module to count lines of code
* Use Event Machine to take lots of concurrent requests http://recipes.sinatrarb.com/p/embed/event-machine
* CRUD Commands should generate explicitly
* Value Store (Service?)
* Domain Console
* Factory for building toppings in pizza
* Hook up pizzas as rack middleware
* Add a Soccer app to the examples
* Deploy a Soccer app for Tanga
* make update take id as separate parameter
* Generate Documentation

## Bugs
* Server DELETE is reporting "no response from server" in curl
* guard isn't running tests when I save pizza_hexagon.rb
* coverage is only showing specs

## Challenges:
* Use Dry libraries inside of the domain?
* Remove all if statements
* Generate an Elixr project
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases
* Figure out scheme to use in memory db in production and periodically flush to real db
