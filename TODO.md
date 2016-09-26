# Pizza Server 0.1

## In Progress
* Explode hecks commands to be more comprehensive

## Current Sprint
* Figure out how to generate the config for the server
* Clean up generator comments
* Establish open source license
* Finish Active Record implementation
* Tests for spec/pizza_server_hexagon
* Figure out where to deploy Docker
* Factory for building toppings in Pizza
* Push it to Github
* Update Hecks Documentation
* Get MySQL Running in in Docker Container
* Use a struct for value objects
* Use relative hex binary automatically if no gem is installed

## Bugs
* We are referencing PizzaHexagon::App, instead of PizzaHexagon
* Server DELETE is reporting "no response from server" in curl
* 'Pizzas' directory shouldn't be camelcased

## Next Actions
* Active Record Generator
* Set up guard to build gems
* Write tests for example app in spec
* Transform Domain object to hash and use to generate json (Use Active Record?)
* Generate API Docs
* Remove test module
* Warn if running a generator without being in a hexagon
* Run domain module generators using cd
* Consider JSON schema for building Domain
* Schema for read (required int?)
* Hook up code coverage on github
* Use invariants (fail)
* Build Gem: hecks build -m pizzas
* 12 factor app in Docker
* Products Domain
* CouchDB Persistence Adapter
* Demonstrate Hexagon Shims
* Set up stats module to count lines of code
* Use Event Machine to take lots of concurrent requests http://recipes.sinatrarb.com/p/embed/event-machine
* Value Store (Service?)
* Domain Event Logger
* Domain Console
* Hook up pizzas as rack middleware
* Add a Soccer app to the examples
* Deploy a Soccer app for Tanga
* make update take id as separate parameter
* Generate Documentation for API

## Challenges:
* Remove all if statements
* Generate a different language
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases
* Figure out scheme to use in memory db in production and periodically flush to real db

## Notes
* Generators are functions.  What if the code is generated for the function to complete?
* Just in time compiling of source code
* Generate the code > Run the code > Delete the code
* Code is always up to date.
