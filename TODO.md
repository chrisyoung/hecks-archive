## In Progress
* Move Domain into its own Project

## Current Sprint
* Hook up pizzas as rack middleware
* Only use invariants (move schema out of hexagon)
* Generate Notifiers
* Update the generators
* Use Event Machine to take lots of concurrent requests http://recipes.sinatrarb.com/p/embed/event-machine
* Hook up code coverage

## Next Sprint
* CouchDB Persistence Adapter
* Demonstrate Hexagon Shims
* Create Pizzas::Hexagon
* Create Pizzas::Domain
* Dockerize the HTTP Server
* Factory for building toppings in pizza
* Rename use cases to commands
* Generator to create config.ru file
* Server gem
* Set up stats module to count lines of code
* Server DELETE is reporting "no response from server" in curl

## Next Actions
* CRUD Commands should generate explicitly
* Value Store (Service?)
* Domain Console
* Add a Soccer app to the examples
* Deploy a Soccer app for Tanga
* make update take id as seperate parameter

## Challenges:
* Remove all if statements
* Generate an Elixr project
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases
* Figure out scheme to use in memory db in production and periodically flush to real db
