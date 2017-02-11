# Hecks 0.1

## In Progress
* Look up domain_module_spec in application when calling commands

## Current Sprint
* Use events port to cache toppings
* DynoDB Repository Generator
* Deploy to Lambda
* Make head available in command
* Look up domain module in builder
* Make the Builder available through the domain

## Next Actions
* Fix text case problems with generators
* Fix indentation in generators
* Generate spec_helper for domain
* Generate Unit Tests as specs
* Check type in validator as well as presence
* Name the server resource_server
* Domain Versioning
* Value Store (Service?)
* SQL repository generator
* Toppings must have at least one entry
* Figure out how to generate the config for the server
* Use relative hex binary automatically if no gem is installed
* Auto Generate API Docs
* Use invariants (fail)
* Use a struct for value objects
* CouchDB Persistence Adapter
* Open source license
* Clean up generator comments
* Tests for all the generators
* Set up guard to build gems
* Set up stats module to count lines of code
* Demonstrate Hexagon Shims for Tanga
* Hook up code coverage on codeclimate
* Build Gem: hecks build -m pizzas
* Package: hecks package -t lambda # generate a serverless package
* Package: hecks package -t docker
* 12 factor app in Docker
* Use Event Machine to take lots of concurrent requests http://recipes.sinatrarb.com/p/embed/event-machine
* Command Line Pizzas
* Hook up pizzas as rack middleware

## Challenges:
* Figure out scheme to use in_memory db in production and periodically flush to real db
* Remove all if statements
* Generate a different language
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases

## Notes
* Just in time compiling of source code?
  * Generators are functions.  What if the code is generated for the function to complete?
  * Generate the code > Run the code > Delete the code
  * Code is always up to date.
