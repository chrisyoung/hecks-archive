## In Progress
Fix specs

## Current Sprint
* Manual Integration Test
* Fix Specs
* Active Record Generator
* Get MySQL Running in in Docker Container
* Factory for building toppings in Pizza
* Fix thor generator output
* Dont generate a double in head_spec generator `let(:id) { double('Id') }`
* dynamically generate test module
* fix behavior spec when generating test entity

## Next Actions
* Warn if running a generator without being in a hexagon
* Consider JSON schema for building Domain
* Schema for read (required int?)
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
* We are referencing PizzaHexagon::App, instead of PizzaHexagon
* Server DELETE is reporting "no response from server" in curl

## Challenges:
* Remove all if statements
* Generate a different language
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases
* Figure out scheme to use in memory db in production and periodically flush to real db
