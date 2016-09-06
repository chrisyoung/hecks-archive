## In Progress
* Move schema validation to hexagon

## Current Sprint
* Performance Testing
* We are referencing PizzaHexagon::App, instead of PizzaHexagon
* Consider JSON schema for building Domain
* Update existing generators
* Generate Notifiers
* Generate Validators
* Generate Active Record
* Generate Schema
* Generator to create config.ru file
* CRUD Commands should generate explicitly
* Get MySQL Running in in Docker Container
* Factory for building toppings in pizza

## Next Actions
* Hook up code coverage
* Use invariants (fail)
* Stop putting entire hecks directory into container
* pizza_hexagon Binary
* Build Gem: hecks build -m pizzas
* 12 factor app in Docker
* Products Domain
* CouchDB Persistence Adapter
* Demonstrate Hexagon Shims
* Set up stats module to count lines of code
* Use Event Machine to take lots of concurrent requests http://recipes.sinatrarb.com/p/embed/event-machine
* Value Store (Service?)
* Domain Console
* Hook up pizzas as rack middleware
* Add a Soccer app to the examples
* Deploy a Soccer app for Tanga
* make update take id as separate parameter
* Generate Documentation for Server

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
