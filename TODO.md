## In Progress
* Move schema validation to hexagon

## Current Sprint
* Update existing generators
* Generate Notifiers
* Generate Validators
* Generate Active Record
* Update the generators
* Hook up code coverage
* Dockerize the HTTP Server
* Use invariants (fail)

## Next Actions
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

## Bugs
* Server DELETE is reporting "no response from server" in curl
* guard isn't running tests when I save pizza_hexagon.rb

## Next Actions
* Use Event Machine to take lots of concurrent requests http://recipes.sinatrarb.com/p/embed/event-machine
* Hook up pizzas as rack middleware
* Dockerize the HTTP Server
* CRUD Commands should generate explicitly
* Value Store (Service?)
* Generator to create config.ru file
* Server gem
* CouchDB Persistence Adapter
* Domain Console
* Hook up code coverage in Code Climate
* Set up stats module to count lines of code
* Add a Soccer app to the examples
* Deploy a Soccer app for Tanga
* make update take id as separate parameter

## Challenges:
* Use Dry libraries inside of the domain?
* Remove all if statements
* Generate an Elixr project
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases
* Figure out scheme to use in memory db in production and periodically flush to real db
